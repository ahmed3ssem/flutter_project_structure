<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/Architecture-Clean-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/State-BLoC%20%2F%20Cubit-purple?style=for-the-badge" />
  <img src="https://img.shields.io/badge/DI-GetIt-orange?style=for-the-badge" />
</p>

<h1 align="center">🏗️ Flutter Project Structure</h1>
<p align="center">
  <em>A production-ready, scalable Flutter template built on Clean Architecture principles — clone it, rename it, and ship faster.</em>
</p>

---

## 📖 Overview

This repository is an **empty feature project** designed as the single source of truth for every new Flutter app you start. Instead of spending days wiring up boilerplate, you clone this template and immediately begin building features.

The structure enforces **Clean Architecture** with a clear separation of concerns across three layers — **Data**, **Domain**, and **Presentation** — while bundling a carefully chosen, production-tested set of packages.

---

## ✨ Advantages

| # | Advantage | Details |
|---|-----------|---------|
| 🚀 | **Zero-setup kickstart** | Everything — DI, routing, theming, networking, storage — is pre-wired. Just rename the package and start coding features. |
| 🏛️ | **Clean Architecture enforced** | Strict folder boundaries prevent accidental layer violations. Business logic never bleeds into the UI layer. |
| 🔀 | **Dual state-management** | Ships with both **flutter_bloc / Cubit** and **GetX** so teams can choose (or mix) approaches per feature. |
| 💉 | **Dependency Injection ready** | `GetIt` service locator with a single `injection_container.dart` — add a dependency in one place, use it anywhere. |
| 🌐 | **Production-grade networking** | `Dio` client wrapped behind an `ApiConsumer` interface, complete with interceptors, status-code handling, and error mapping. |
| 📶 | **Connectivity awareness** | `NetworkInfo` abstraction checks internet availability before every API call — no more unhandled `SocketException`s. |
| 🎨 | **Full theming system** | Light & dark themes, custom `Styles` typography, `AppColors` palette, hex-color helper, and a `ThemeCubit` for runtime switching — all out of the box. |
| 🔐 | **Secure & plain storage** | Two storage layers: `flutter_secure_storage` for tokens/sensitive data, `shared_preferences` (via `Prefs`/`Helper`) for user settings. |
| 🗂️ | **Centralised assets** | `AssetsManager` and `AppStrings` / `AppConstant` ensure no magic strings or asset paths scattered across the codebase. |
| 📜 | **Multi-language ready** | `LocalStrings` + locale initialization (`initializeDateFormatting`) scaffold internationalization from day one. |
| 📟 | **BLoC observer** | Global `AppBlocObserver` logs every event, transition, and error — debugging state changes is trivial. |
| 📱 | **Device preview integration** | `DevicePreview` is included (toggled off in production) so you can visually test any device/OS combo without a physical device. |
| 📄 | **Pagination out of the box** | `CustomPaginationListener` + `CustomBottomLoading` cover the classic scroll-to-load-more pattern with a loading indicator. |
| 🛠️ | **Reusable widget library** | 15+ pre-built widgets (buttons, text fields, image loaders, snack bars, error/empty states, SVG support, overlays, etc.) to keep UI code DRY. |
| 🔗 | **Deep-link & sharing services** | `LaunchUrlsService` and `ShareService` are registered in the DI container and ready to inject anywhere. |
| 📐 | **Responsive sizing** | `flutter_screenutil` is integrated for pixel-perfect responsive layouts across phones and tablets. |
| ⚙️ | **Strict lint rules** | `analysis_options.yaml` + `flutter_lints` enforces code quality from the first file you create. |
| 🧪 | **Test infrastructure** | `test/` directory exists and is ready for unit, widget, and integration tests. |

---

## 🗂️ Project Structure

```
lib/
├── main.dart                    # App entry point — bootstraps DI, locale, BLoC observer
├── app.dart                     # Root MaterialApp widget
├── bloc_observer.dart           # Global BLoC/Cubit lifecycle logger
├── injection_container.dart     # GetIt service locator — registers ALL dependencies
│
├── config/                      # App-wide configuration (no business logic)
│   ├── PrefHelper/
│   │   ├── prefs.dart           # SharedPreferences thin wrapper
│   │   └── helper.dart          # Language/locale preference helper
│   ├── arguments/
│   │   └── routes_arguments.dart  # Typed route argument classes
│   ├── routes/
│   │   └── app_routes.dart      # Named-route definitions
│   └── theme/
│       ├── app_theme.dart       # ThemeData factory
│       ├── light_theme.dart     # Light mode overrides
│       ├── dark_theme.dart      # Dark mode overrides
│       ├── styles.dart          # Centralised TextStyle definitions
│       ├── theme_cubit.dart     # Runtime light/dark toggle Cubit
│       └── theme_helper.dart    # Theme utility extensions
│
├── core/                        # Cross-cutting infrastructure
│   ├── api/
│   │   ├── api_consumer.dart    # Abstract API interface (Dio-agnostic)
│   │   ├── dio_consumer.dart    # Concrete Dio implementation
│   │   ├── app_interceptor.dart # Auth token injection & logging interceptor
│   │   ├── end_points.dart      # All API endpoint constants
│   │   └── status_code.dart     # HTTP status code constants
│   ├── error/
│   │   ├── exceptions.dart      # Custom exception types (Server, Cache, Network…)
│   │   └── failures.dart        # Failure sealed classes for Either<Failure, T>
│   ├── network/
│   │   └── network_info.dart    # NetworkInfo abstract + InternetConnectionChecker impl
│   ├── preferences/
│   │   └── flutter_secure_storage.dart  # Encrypted key-value storage wrapper
│   ├── services/
│   │   ├── launch_urls.dart     # url_launcher service
│   │   └── share_service.dart   # share_plus service
│   ├── usecase/
│   │   └── use_case.dart        # Generic UseCase<Type, Params> base class
│   ├── init_config/             # (Placeholder) App-init side-effects
│   └── utils/
│       ├── app_colors.dart      # Color palette constants
│       ├── app_constant.dart    # Global app constants
│       ├── app_strings.dart     # English string constants
│       ├── local_strings.dart   # Localized / Arabic string constants
│       ├── assets_manager.dart  # Asset path constants (images, fonts)
│       ├── error_handler.dart   # Maps exceptions → user-facing messages
│       ├── hex_color.dart       # HexColor extension utility
│       └── system_ui.dart       # Status-bar / navigation-bar style config
│
├── enums/
│   └── enums.dart               # App-wide enumerations
│
├── feature/                     # 📂 YOUR FEATURES GO HERE
│   └── (empty — add feature folders following Clean Architecture layers)
│
└── widgets/                     # Shared, reusable UI components
    ├── button_widget.dart
    ├── custom_text_field.dart
    ├── text_widget.dart
    ├── textfield_widget.dart
    ├── image_loader.dart        # Cached network image with placeholder/error states
    ├── svg_image_widget.dart
    ├── loading_item.dart
    ├── loading_overlay_widget.dart
    ├── error_widget.dart        # Full-screen error state with retry action
    ├── empty_data_widget.dart   # Empty-list / no-data illustration widget
    ├── message_widget.dart
    ├── snack_bar_widget.dart
    ├── aligment_widget.dart
    ├── skip_widget.dart
    ├── delay_class.dart
    └── pagination/
        ├── custom_pagination_listener.dart   # Scroll-based load-more trigger
        └── custom_bottom_loading.dart        # Bottom-of-list loading indicator
```

---

## 📦 Packages at a Glance

### State Management
| Package | Purpose |
|---------|---------|
| `flutter_bloc` | BLoC & Cubit pattern for reactive state management |
| `get` | GetX — lightweight alternative for simple state & navigation |
| `equatable` | Value equality for BLoC states/events without boilerplate |
| `dartz` | Functional programming — `Either<Failure, Success>` for error handling |

### Networking
| Package | Purpose |
|---------|---------|
| `dio` | Powerful HTTP client with interceptor support |
| `pretty_dio_logger` | Formatted request/response logs in debug console |
| `http` | Lightweight HTTP for simple requests |
| `internet_connection_checker` | Real connectivity check before network calls |

### Storage
| Package | Purpose |
|---------|---------|
| `shared_preferences` | Lightweight key-value store for user preferences |
| `flutter_secure_storage` | AES-encrypted storage for tokens and sensitive data |

### UI & UX
| Package | Purpose |
|---------|---------|
| `flutter_screenutil` | Responsive sizes (sp, dp) scaled to screen |
| `flutter_svg` | SVG asset rendering |
| `cached_network_image` | Remote image caching with placeholder/error builders |
| `loading_animation_widget` | Polished loading animations |
| `device_preview` | Test any device viewport in-app during development |

### Utilities
| Package | Purpose |
|---------|---------|
| `get_it` | Service locator / dependency injection |
| `url_launcher` | Open URLs, emails, phone numbers |
| `share_plus` | Native share sheet integration |
| `image_picker` | Camera / gallery image selection |

### Fonts
| Font | Weights | Usage |
|------|---------|-------|
| **Cambay** | 400, 700 | Latin / English UI |
| **Tajawal** | 400, 500, 700, 800 | Arabic / RTL UI |

---

## 🚀 Getting Started

### 1. Clone & rename

```bash
git clone https://github.com/your-username/flutter_project_structure.git my_new_app
cd my_new_app
```

Rename the package in `pubspec.yaml` and update all imports (use your IDE's global rename or the `rename` CLI):

```bash
dart pub global activate rename
rename setBundleId --value com.yourcompany.myapp
rename setAppName --value "My New App"
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Configure the API base URL

Open `lib/core/api/end_points.dart` and set your base URL:

```dart
class EndPoints {
  static const String baseUrl = 'https://api.yourbackend.com/v1/';
}
```

### 4. Add your first feature

Create a folder under `lib/feature/` following Clean Architecture layers:

```
lib/feature/auth/
├── data/
│   ├── datasources/    # Remote & local data sources
│   ├── models/         # JSON-serializable model classes
│   └── repositories/   # Repository implementations
├── domain/
│   ├── entities/       # Pure Dart business entities
│   ├── repositories/   # Repository abstract contracts
│   └── usecases/       # Single-responsibility use cases
└── presentation/
    ├── cubit/          # Cubit + State classes
    ├── pages/          # Screen widgets
    └── widgets/        # Feature-scoped widgets
```

### 5. Register your dependencies

Open `lib/injection_container.dart` and add your registrations:

```dart
// Blocs
sl.registerFactory(() => AuthCubit(loginUseCase: sl()));

// Repositories
sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
  remoteDataSource: sl(),
  networkInfo: sl(),
));

// Data Sources
sl.registerLazySingleton<AuthRemoteDataSource>(() =>
  AuthRemoteDataSourceImpl(consumer: sl()));
```

### 6. Add your route

In `lib/config/routes/app_routes.dart`, define the route name and wire it up in `app.dart`.

---

## 🎨 Theming

Switch between light and dark mode at runtime via the `ThemeCubit` already provided in the DI container:

```dart
// Anywhere in the widget tree
context.read<ThemeCubit>().toggleTheme();
```

Customise colors in `lib/core/utils/app_colors.dart` and typography in `lib/config/theme/styles.dart`.

---

## 🔐 Secure Storage

Use the injected `MySecureStorage` for tokens:

```dart
final storage = sl<MySecureStorage>();
await storage.write(key: 'access_token', value: token);
final token = await storage.read(key: 'access_token');
```

---

## 📶 Network-aware repository pattern

```dart
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.login(email, password);
        return Right(user);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
```

---

## 🧪 Testing

The `test/` directory is ready. Recommended structure:

```
test/
├── core/
│   ├── api/
│   └── network/
└── feature/
    └── auth/
        ├── data/
        ├── domain/
        └── presentation/
```

Run tests:

```bash
flutter test
```

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feat/my-improvement`
3. Commit your changes: `git commit -m 'feat: add my improvement'`
4. Push to the branch: `git push origin feat/my-improvement`
5. Open a Pull Request

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

<p align="center">
  Made with ❤️ to help Flutter developers ship faster & cleaner.
</p>
