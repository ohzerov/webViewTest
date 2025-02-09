sealed class StartupState {}

class StartupInitial extends StartupState {}

class StartupLoading extends StartupState {}

class StartupSuccess extends StartupState {}

class StartupFailure extends StartupState {}
