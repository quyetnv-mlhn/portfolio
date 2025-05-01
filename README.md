# Portfolio Website

A personal portfolio website built with Flutter Web, showcasing my professional journey, skills, and projects.

## 🌟 Overview

This portfolio website serves as a digital showcase of my work, skills, and experiences. Built with Flutter Web, it offers a responsive and interactive user experience across all devices.

## ✨ Features

- Responsive design for all screen sizes
- Dark/Light theme switching
- Bilingual support (English/Vietnamese)
- Interactive UI elements
- Project showcase with detailed descriptions
- Technical skills section
- Professional contact information
- Comprehensive social media integration
- Animated text and UI components
- Clean and modern design

## 🛠 Technologies

- **Framework:** Flutter Web
- **State Management:** Riverpod
- **Navigation:** Go Router
- **Localization:** Easy Localization
- **Animations:** Animated Text Kit
- **External Links:** URL Launcher
- **Code Generation:** Build Runner
- **Asset Generation:** Flutter Gen
- **Environment:** Flutter Flavors

## 🚀 Getting Started

### Prerequisites

- Flutter (latest version)
- Dart SDK (latest version)
- Git
- Chrome Browser (for development)

### Installation & Setup

1. Clone the repository
```bash
git clone https://github.com/quyetnv-mlhn/portfolio
cd portfolio
```

2. Copy the sample environment file and update variables
```bash
cp assets/env/.env.template assets/env/.env.dev &&
cp assets/env/.env.template assets/env/.env.stg &&
cp assets/env/.env.template assets/env/.env.prod
```
- Update environment variables in `.env.dev`, `.env.stg`, and `.env.prod` as needed for each environment.

3. Setup environment and generate necessary files
```bash
flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs && dart run easy_localization:generate -S assets/translations -O lib/gen && dart run easy_localization:generate -S assets/translations -s en-US.json -O lib/gen -o locale_keys.g.dart -f keys && dart fix --apply && dart format .
```

4. Run the application
```bash
flutter run -d chrome
```

## 🔧 Environment Setup

1. Copy the sample environment file:
```bash
cp assets/env/.env.template assets/env/.env.dev &&
cp assets/env/.env.template assets/env/.env.stg &&
cp assets/env/.env.template assets/env/.env.prod
```

2. Update environment variables in `.env.dev`, `.env.stg`, and `.env.prod` as needed for each environment.

## 🏭 Build

### Web
```bash
flutter build web
```

### Development
```bash
flutter run --flavor development --target lib/main_dev.dart
```

### Production
```bash
flutter run --flavor production --target lib/main_prod.dart
```

## 📂 Project Structure

```
lib/
├── app/                          # Application configuration
│   ├── app.dart                  # Main app configuration
│   └── provider_observer.dart    # Riverpod provider observer
├── core/                         # Core functionalities
│   ├── configs/                  # Configuration files
│   ├── constants/                # Constants
│   ├── enums/                    # Enumerations
│   ├── extensions/               # Extension methods
│   ├── utils/                    # Utility functions
│   └── exceptions/               # Custom exceptions
├── data/                         # Data layer
│   ├── repositories/             # Repository implementations
│   └── services/                 # Service classes (if any)
├── domain/                       # Domain layer
│   ├── repositories/             # Repository interfaces
│   └── models/                   # Data models
├── ui/                           # Presentation layer
│   ├── routes/                   # Route configurations
│   │   └── app_router.dart       # App routing logic
│   ├── shared/                   # Shared UI components
│   └── views/                    # Screen-specific UI
├── gen/                          # Generated files
├── flavors/                      # Flavor-specific entry points
└── main.dart                     # Default entry point
```

## 🧪 Testing

```bash
flutter test
```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

Nguyễn Văn Quyết
- GitHub: [@quyetnv-mlhn](https://github.com/quyetnv-mlhn)
- LinkedIn: [Nguyễn Văn Quyết](https://linkedin.com/in/quyetnv)

## ⭐ Support

Give a ⭐️ if you like this project!
