abstract class ProjectionHandler<T> {
  const ProjectionHandler();

  Type get eventType => T;

  Future<void> project(T event);
}
