import 'dart:io';

import 'package:mustache_template/mustache.dart';
import 'package:path/path.dart' as path;

mixin MailTemplateLoaderMixin {
  static final Map<String, Template> _templatesCache = {};

  Future<Template> loadTemplate({required String templateName, required String templatesFolderPath}) async {
    if (_templatesCache.containsKey(templateName)) {
      return _templatesCache[templateName]!;
    }

    final file = File(path.join(templatesFolderPath, '$templateName.html'));

    if (!file.existsSync()) {
      throw Exception('Template $templateName not found at ${file.path}');
    }

    final source = await file.readAsString();
    final template = Template(source);

    _templatesCache[templateName] = template;

    return template;
  }
}
