## Getting Started

This project is a starting point for a Laravel ft React JS.

### ✅ Short Description (max 80 characters)

Ask questions about education and get instant answers with TOS REAN App.

### ✅ Full Description (up to 4000 characters)

TOS REAN App is an educational assistant powered by artificial intelligence, designed to help students get clear, accurate, and instant answers to their questions about learning, school life, study tips.

```python
/lib
 ├── main.dart                  # App entry point
 ├── app.dart                   # App root widget, MaterialApp setup
 │
 ├── /core                      # Core utilities, constants, and themes
 │   ├── constants/             # App-wide constants (strings, keys, etc.)
 │   ├── theme/                 # Colors, text styles, dark/light themes
 │   ├── utils/                 # Helper functions, formatters, validators
 │   ├── errors/                # Custom exceptions, error handling
 │   └── services/              # Local storage, notification, API configs
 │
 ├── /data                      # Data layer
 │   ├── models/                # Data models (e.g., User, Quiz, Question)
 │   ├── providers/             # Firebase, REST API, GraphQL providers
 │   ├── repositories/          # Abstraction between data & business logic
 │   └── local/                 # Local DB (Hive/SQLite/SharedPrefs)
 │
 ├── /domain                    # Business logic (optional but clean)
 │   ├── entities/              # Core entities (business rules)
 │   ├── usecases/              # Application-specific logic (e.g., loginUser)
 │   └── repositories/          # Interfaces for repositories
 │
 ├── /presentation              # UI Layer
 │   ├── /screens               # Screens/pages
 │   │   ├── auth/              # Example: Auth screen
 │   │   │   ├── widgets/
 │   │   │   │   ├── login_form.dart
 │   │   │   │   └── social_login_buttons.dart
 │   │   │   ├── controller.dart
 │   │   │   ├── login_screen.dart
 │   │   │   └── register_screen.dart
 │   │   │
 │   │   ├── home/              # Example: Home screen
 │   │   │   ├── widgets/
 │   │   │   │   ├── home_header.dart       # AppBar with logo, bell, search
 │   │   │   │   ├── banner_section.dart    # Purple banner "Play quiz together"
 │   │   │   │   ├── discover_section.dart  # Horizontal cards list
 │   │   │   │   ├── author_section.dart    # Top Authors (avatars row)
 │   │   │   │   └── bottom_nav.dart        # Bottom navigation bar
 │   │   │   └── home_screen.dart
 │   │   │
 │   │   └── library/              # Example: library screens
 │   │   │   ├── widgets/
 │   │   │   └── library_screen.dart
 │   │
 │   ├── /widgets               # Shared reusable widgets (buttons, inputs)
 │   ├── /animations            # Lottie, custom animations
 │   └── /routes                # App navigation (GoRouter / Navigator)
 │
 ├── /state_management          # Your state management (Provider, BLoC, Riverpod, etc.)
 │   └── controllers/           # For GetX or MobX
 │   │   ├── auth/              # Example: Home screen
 │   │   │   └── auth_controller.dart
 │   │   ├── home/              # Example: Home screen
 │   │   │   └── home_controller.dart
 │   │   ├── library/              # Example: Home screen
 │   │   │   └── home_controller.dart
 │   │   ├── join/              # Example: Home screen
 │   │   │   └── join_controller.dart
 │   │   │
 ├── /config                    # App-level configs (env, flavors, DI setup)
 │   ├── environment.dart
 │   └── dependency_injection.dart
 │
 └── /generated                 # Auto-generated files (intl, json_serializable)
```
