# Portfolio Website

A personal portfolio website built with Flutter Web, showcasing my professional journey, skills, and projects.

## 🌟 Overview

This portfolio website serves as a digital showcase of my work, skills, and experiences. Built with Flutter Web, it offers a responsive and interactive user experience across all devices.

## ✨ Features

- Responsive design for all screen sizes
- Dark/Light theme switching
- Bilingual support (English/Vietnamese)
- Interactive UI elements
- Project showcase
- Blog section
- Contact information
- Social media integration

## 🛠 Technologies

- **Framework:** Flutter Web
- **State Management:** Riverpod
- **Navigation:** Go Router
- **Localization:** Easy Localization
- **Animations:** Animated Text Kit
- **External Links:** URL Launcher

## 🚀 Getting Started

### Prerequisites

- Flutter (latest version)
- Dart SDK
- Git

### Installation

1. Clone the repository
```bash
git clone https://github.com/quyetnv-mlhn/portfolio
cd portfolio
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the application
```bash
flutter run -d chrome
```

## 🔧 Environment Setup

1. Copy the sample environment file:
```bash
cp assets/env/.env.template assets/env/.env.dev
```

2. Update environment variables in `.env.dev`

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
├── app/                    # Application configuration
├── core/                   # Core functionalities
│   ├── configs/           # Configuration files
│   ├── constants/         # Constants
│   ├── enums/            # Enumerations
│   ├── extensions/        # Extension methods
│   └── utils/            # Utility functions
├── data/                  # Data layer
├── domain/               # Domain layer
├── ui/                   # Presentation layer
│   ├── routes/          # Route configurations
│   ├── shared/          # Shared widgets
│   └── views/           # Screens
└── main.dart            # Entry point
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

