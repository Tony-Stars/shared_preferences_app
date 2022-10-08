
enum DevelopmentType {
  frontend,
  backend,
  desktop,
  mobile;

  @override
  String toString() {
    switch (this) {
      case DevelopmentType.frontend:
        return "Frontend";
      case DevelopmentType.backend:
        return "Backend";
      case DevelopmentType.desktop:
        return "Desktop";
      case DevelopmentType.mobile:
        return "Mobile";
    }
  }
}

enum ProgrammingLanguage {
  JavaScript,
  Dart,
  Python,
  Java,
  PHP,
  Swift;

  @override
  String toString() {
    switch (this) {
      case ProgrammingLanguage.JavaScript:
        return "JavaScript";
      case ProgrammingLanguage.Dart:
        return "Dart";
      case ProgrammingLanguage.Python:
        return "Python";
      case ProgrammingLanguage.Java:
        return "Java";
      case ProgrammingLanguage.PHP:
        return "PHP";
      case ProgrammingLanguage.Swift:
        return "Swift";
    }
  }
}
