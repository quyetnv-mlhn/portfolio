enum Environment { dev, stg, prod }

extension EnvironmentExtension on Environment {
  String get name {
    switch (this) {
      case Environment.dev:
        return 'dev';
      case Environment.stg:
        return 'stg';
      case Environment.prod:
        return 'prod';
    }
  }
}
