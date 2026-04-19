import 'dart:io';

import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/presentation/base/failure_mapper.dart';

class AuthFailureMapper extends FailureMapper<AuthFailure> {
  @override
  FailurePresentation map(AuthFailure failure) {
    return switch (failure) {
      EmailAlreadyInUse() => (HttpStatus.conflict, 'This email is already registered.'),
      InvalidEmail() => (HttpStatus.badRequest, 'The provided email address is invalid.'),
      InvalidPassword() => (HttpStatus.badRequest, 'The password does not meet security requirements.'),
      InvalidCredentials() => (HttpStatus.unauthorized, 'Invalid email or password.'),
      UserNotVerified() => (HttpStatus.forbidden, 'Please verify your email address to continue.'),
      UserNotFound() => (HttpStatus.notFound, 'User with this email was not found.'),
      AuthCodeNotFound() => (HttpStatus.notFound, 'Verification code not found or already processed.'),
      AuthCodeInvalid() => (HttpStatus.badRequest, 'The provided verification code is invalid.'),
      AuthCodeAlreadyUsed() => (HttpStatus.gone, 'This verification code has already been used.'),
      AuthCodeExpired() => (HttpStatus.gone, 'Verification code has expired. Please request a new one.'),
      AuthCodeMaxAttemptsReached() => (HttpStatus.tooManyRequests, 'Maximum verification attempts reached.'),
      AuthCodeIncorrect(remainingAttempts: final attempts) => (
        HttpStatus.badRequest,
        'Incorrect code. Remaining attempts: $attempts.',
      ),
      UserAlreadyVerified() => (HttpStatus.conflict, 'This user is already verified.'),
      AuthCodeRequestTooFrequent(retryAfterSeconds: final seconds) => (
        HttpStatus.tooManyRequests,
        'Too many requests. Please try again in $seconds seconds.',
      ),
      AuthSessionNotFound() => (
        HttpStatus.unauthorized,
        'Active session not found. Please log in again.',
      ),
      AuthSessionInvalid() => (
        HttpStatus.unauthorized,
        'Your session is no longer valid or has been revoked.',
      ),
      AuthTokenInvalid() => (
        HttpStatus.unauthorized,
        'Security alert: Invalid or reused authentication token.',
      ),
    };
  }
}
