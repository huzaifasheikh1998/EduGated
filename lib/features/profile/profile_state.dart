import 'package:edugated/domain/entities/user.dart';

class ProfileState {
  final User user;
  final bool isLoading;
  final String? error;
  const ProfileState({
    required this.isLoading,
    required this.user,
    this.error,
  });

  factory ProfileState.initial() =>
      const ProfileState(isLoading: false, user: User.empty());

  ProfileState copyWith({User? user, bool? isLoading, String? error}) =>
      ProfileState(
          user: user ?? this.user,
          isLoading: isLoading ?? this.isLoading,
          error: error ?? this.error);
}
