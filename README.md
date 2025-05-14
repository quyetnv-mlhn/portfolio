# Portfolio Website

A personal portfolio website built with **Flutter Web**, showcasing my professional journey, skills, and projects.

## 🌐 Overview

This responsive and interactive website serves as a digital showcase of my work, skills, and experience. Built entirely with **Flutter Web**, it is optimized for all modern browsers and provides an engaging user experience across devices.

## ✨ Features

- **Responsive** UI for all screen sizes
- **Light/Dark theme** toggle
- **Bilingual** support (English & Vietnamese)
- **Interactive animations** (UI and text effects)
- Detailed **project showcase** with descriptions and links
- **Skills** and **tech stack** overview
- **Professional contact** information and social media links
- Clean, modern **UI design** with intuitive navigation

## 🛠 Tech Stack

- **Framework:** Flutter Web  
- **State Management:** Riverpod  
- **Routing:** Go Router  
- **Localization:** Easy Localization  
- **Animations:** Animated Text Kit  
- **Environment Config:** Flutter Flavors  
- **Code Gen:** Build Runner, Flutter Gen  
- **External Links:** URL Launcher  

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK** (latest)
- **Dart SDK** (latest)
- **Git**
- **Chrome** (recommended for development)

### Installation

Clone the repository and set up the environment:

```bash
git clone https://github.com/quyetnv-mlhn/portfolio
cd portfolio
```

### Environment Setup

Copy the environment templates and adjust variables:

```bash
cp assets/env/.env.template assets/env/.env.dev
cp assets/env/.env.template assets/env/.env.stg
cp assets/env/.env.template assets/env/.env.prod
```

Edit the `.env` files for each environment (development, staging, production).

> ⚠️ **Important:** You **must** set the `FORMSPREE_ENDPOINT` variable in each `.env` file.  
> Without this, the contact form will **not** work.

### Code Generation & Localization

Generate code, localization files, and apply formatting:

```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
dart run easy_localization:generate -S assets/translations -O lib/gen
dart run easy_localization:generate -S assets/translations -s en-US.json -O lib/gen -o locale_keys.g.dart -f keys
dart fix --apply
dart format .
```

### Running the App

To run on **Chrome**:

```bash
flutter run -d chrome
```

## 🧪 Testing

To run unit tests:

```bash
flutter test
```

## 🏗️ Build

To build the web version:

```bash
flutter build web --release --base-href / -t lib/flavors/main_dev.dart canvaskit
```

## 📂 Project Structure

```
lib/
├── app/                 # App entry point and provider observer
├── core/                # Core utilities, constants, enums
│   ├── constants/       # App constants
│   ├── enums/           # Enums for different use cases
│   ├── utils/           # Utility functions
│   ├── exceptions/      # Custom exceptions
│   ├── extensions/      # Extensions on existing classes
│   └── configs/         # App configuration files (sizes, colors, etc.)
├── data/                # Data layer: repositories and services
│   ├── repositories/    # Repository implementations
│   └── services/        # External services
├── domain/              # Domain layer: business models and repository contracts
├── flavors/             # Flavor-specific files (production, staging, dev)
├── gen/                 # Generated code (assets, localization)
└── ui/                  # User Interface
    ├── routes/          # Routing and navigation setup
    ├── shared/          # Shared components: themes, widgets, transitions
    └── views/           # Feature-based views (e.g., Home, About Me, Skills)
        ├── experience/  # Feature: experience view models, models, views
        ├── base_screen/ # Base screen layout, navigation
        ├── home/        # Home screen related files
        ├── contact/     # Contact form and related files
        ├── about_me/    # About me section components
        └── skills/      # Skills section components
```

## 🤝 Contributing

Contributions are **welcome**! If you'd like to help improve or enhance this project, please follow these steps:

1. **Fork** the repository.
2. Create a new **branch** (`git checkout -b feature-name`).
3. Make your changes.
4. **Commit** your changes (`git commit -am 'Add new feature'`).
5. Push your changes (`git push origin feature-name`).
6. Open a **pull request** with a clear description of what you've done.

### Issues and Feature Requests

Feel free to **open an issue** for any bugs, feature requests, or suggestions. I encourage the community to help by reporting problems or suggesting new features.

### Roadmap

- **Current Focus:**  
  - Improve accessibility and performance.
  - Expand features in the project showcase section.
  - Enhance internationalization (add more languages).
  
- **Future Plans:**  
  - Implement more interactive and dynamic components.
  - Optimize the website for SEO and better discoverability.
  - Add a blog or blog-like feature to share thoughts and tutorials.

Check the **[Issues](https://github.com/quyetnv-mlhn/portfolio/issues)** and **[Projects](https://github.com/quyetnv-mlhn/portfolio/projects)** sections for more information.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Nguyễn Văn Quyết**  
- GitHub: [@quyetnv-mlhn](https://github.com/quyetnv-mlhn)  
- LinkedIn: [Nguyễn Văn Quyết](https://linkedin.com/in/quyetnv)

## 🌍 Demo

Check out the live demo of this project here: [http://quyetnv.pantech.vn/](http://quyetnv.pantech.vn/)

## ⭐ Support

If you like this project, please give it a ⭐️!
