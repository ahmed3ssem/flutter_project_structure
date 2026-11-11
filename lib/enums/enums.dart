/// Standard async request state for Cubit/Bloc feature states
enum RequestState {
  initial,
  loading,
  success,
  error,
}

/// App environment mode
enum AppEnvironment {
  dev,
  staging,
  production,
}
