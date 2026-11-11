<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/Architecture-Clean-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/State-BLoC%20%2F%20Cubit-purple?style=for-the-badge" />
  <img src="https://img.shields.io/badge/DI-GetIt-orange?style=for-the-badge" />
</p>

<h1 align="center">🏗️ Flutter Clean Architecture Project Template</h1>
<p align="center">
  <em>A production-grade, secure, and scalable Flutter starter template built on Clean Architecture principles.</em>
</p>

---

## 📖 Overview

This repository is a hardened base template designed to kickstart any new Flutter application. It enforces strict Clean Architecture boundaries across **Data**, **Domain**, and **Presentation** layers, while providing robust networking, theming, secure session storage, and localization out of the box.

---

## ✨ Key Architectural Advantages

| # | Advantage | Details |
|---|-----------|---------|
| 🏛️ | **Clean Architecture** | Clear separation of concerns: Presentation (Cubit), Domain (UseCases, Entities, Failures), Data (Models, DataSources, Repositories). |
| 🌐 | **Hardened Dio Networking** | `DioConsumer` with `AppInterceptor` for auth injection, automatic language syncing, full HTTP verbs (`GET`, `POST`, `PUT`, `PATCH`, `DELETE`), safe JSON decoding, and status code error mapping. |
| 🛡️ | **Safe & Typed Error Handling** | Functional error handling with `dartz` (`Either<Failures, T>`). Typed `ServerException` propagates real backend messages without loss. |
| 🔐 | **Dual-Layer Coordinated Storage** | `FlutterSecureStorage` (AES/Keychain) for sensitive tokens & credentials; `SharedPreferences` (`Prefs`) for user UI preferences. |
| 🎨 | **Material 3 Adaptive Theming** | Complete Light & Dark themes with `ThemeCubit` for runtime switching, dynamic Material 3 color schemes, and theme-aware UI components. |
| 🌐 | **Bilingual / RTL First** | Arabic (`Tajawal`) and English (`Cambay`) font families pre-wired with native directional widgets (`AlignmentDirectional`, `EdgeInsetsDirectional`). |
| 💉 | **Dependency Injection** | Centralized `GetIt` locator in `injection_container.dart` for single-line dependency registration. |
| 📱 | **Responsive Design** | Integrated `flutter_screenutil` with gentle accessibility scaling guards (`textScaler.clamp`). |
| 🧩 | **Production UI Components** | Unified buttons with loading state, secure text fields with password toggling, cached image loaders with graceful fallbacks, and floating snackbars. |

---

## 🗂️ Project Structure

```
lib/
├── app.dart                     # Root MaterialApp widget & theme builder
├── bloc_observer.dart           # AppBlocObserver for logging state transitions
├── injection_container.dart     # GetIt service locator — registers all dependencies
├── main.dart                    # App entry point (initializes storage, DI, locale)
│
├── config/                      # App configuration
│   ├── PrefHelper/
│   │   ├── helper.dart          # Language/locale preferences helper
│   │   └── prefs.dart           # SharedPreferences type-safe wrapper
│   ├── arguments/
│   │   └── routes_arguments.dart# Typed route argument classes
│   ├── routes/
│   │   └── app_routes.dart      # Named-route definitions & 404 handler
│   └── theme/
│       ├── dark_theme.dart      # Material 3 Dark theme specification
│       ├── light_theme.dart     # Material 3 Light theme specification
│       ├── styles.dart          # Semantic typography & font-family scales
│       ├── theme_cubit.dart     # Runtime theme mode switcher
│       └── theme_helper.dart    # Context-aware theme & color helper
│
├── core/                        # Cross-cutting infrastructure
│   ├── api/
│   │   ├── api_consumer.dart    # Abstract API interface (GET, POST, PUT, PATCH, DELETE)
│   │   ├── app_interceptor.dart # Injects Bearer token, Accept-Language, Content-Type
│   │   ├── dio_consumer.dart    # Robust Dio implementation with error mapping
│   │   ├── end_points.dart      # Base URLs and API endpoint paths
│   │   └── status_code.dart     # HTTP status code constants
│   ├── error/
│   │   ├── exceptions.dart      # Data layer exceptions (Server, BadRequest, etc.)
│   │   └── failures.dart        # Domain layer failures for Either<Failures, T>
│   ├── network/
│   │   └── network_info.dart    # Connectivity checker abstraction
│   ├── preferences/
│   │   └── flutter_secure_storage.dart # Encrypted Keychain/Keystore wrapper
│   ├── services/
│   │   ├── launch_urls.dart     # Safe external link, phone, email & map launcher
│   │   └── share_service.dart   # Native platform share sheet service
│   ├── usecase/
│   │   └── use_case.dart        # Generic UseCase<Type, Params> contract
│   └── utils/
│       ├── app_colors.dart      # Palette definitions
│       ├── app_constant.dart    # Standard padding, radius, and duration constants
│       ├── app_strings.dart     # Core app string constants & keys
│       ├── assets_manager.dart  # Centralized asset path constants
│       ├── error_handler.dart   # Framework-level Flutter error handler
│       ├── hex_color.dart       # Safe 3, 6, and 8-digit hex color parser
│       ├── local_strings.dart   # English and Arabic localization mappings
│       └── system_ui.dart       # Status bar and navigation bar styling
│
├── enums/
│   └── enums.dart               # RequestState, AppEnvironment, and app-wide enums
│
├── feature/                     # 📂 Feature modules
│   └── <feature_name>/
│       ├── data/                # DataSources, Models, RepositoriesImpl
│       ├── domain/              # Entities, Repositories, UseCases
│       └── presentation/        # Cubits/Blocs, Pages, Widgets
│
└── widgets/                     # Reusable UI component library
    ├── button_widget.dart       # Primary button with loading & disabled states
    ├── custom_text_field.dart   # Form textfield with password visibility & icons
    ├── textfield_widget.dart    # Backward-compatible text field wrapper
    ├── image_loader.dart        # Cached network image with placeholder & error fallback
    ├── svg_image_widget.dart    # Safe SVG renderer with color filtering
    ├── loading_item.dart        # Polished progress animation
    ├── loading_overlay_widget.dart # Modal loading overlay
    ├── error_widget.dart        # Centered error screen with retry action
    ├── empty_data_widget.dart   # Empty state placeholder with retry
    ├── message_widget.dart      # Floating SnackBar feedback service
    ├── snack_bar_widget.dart    # Fast SnackBar helper
    ├── skip_widget.dart         # Actionable text with native underline
    ├── delay_class.dart         # Invoked debounce/delay helper
    └── pagination/
        ├── custom_pagination_listener.dart # Scroll-based load-more trigger
        └── custom_bottom_loading.dart      # Pagination footer loader
```

---

## 🚀 Getting Started

### 1. Configure the API Base URL

In `lib/core/api/end_points.dart`:
```dart
class EndPoints {
  static const liveUrl = 'https://api.yourdomain.com/v1/';
  static const devUrl = 'https://dev-api.yourdomain.com/v1/';
}
```

### 2. Implement a New Feature

Create your feature under `lib/feature/<feature_name>/` adhering to Clean Architecture:
```
lib/feature/auth/
├── data/
│   ├── datasources/auth_remote_data_source.dart
│   ├── models/user_model.dart
│   └── repositories/auth_repository_impl.dart
├── domain/
│   ├── entities/user.dart
│   ├── repositories/auth_repository.dart
│   └── usecases/login_use_case.dart
└── presentation/
    ├── cubit/auth_cubit.dart
    ├── cubit/auth_state.dart
    └── pages/login_page.dart
```

### 3. Register in Dependency Injection

In `lib/injection_container.dart`:
```dart
// Blocs
sl.registerFactory(() => AuthCubit(loginUseCase: sl()));

// UseCases
sl.registerLazySingleton(() => LoginUseCase(sl()));

// Repositories
sl.registerLazySingleton<AuthRepository>(
  () => AuthRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
);

// DataSources
sl.registerLazySingleton<AuthRemoteDataSource>(
  () => AuthRemoteDataSourceImpl(consumer: sl()),
);
```

---

## 🧪 Testing

Run all unit and widget tests:
```bash
flutter test
```
