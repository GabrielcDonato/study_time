part of '../user/user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {
  const UserInitial();
}

final class UserLoading extends UserState {
  const UserLoading();
}

final class UserError extends UserState {
  final String message;

  const UserError({required this.message});

  @override
  List<Object> get props => [message];
}

final class UserSuccess extends UserState {
  final User user;

  const UserSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

final class LogoutLoading extends UserState {
  const LogoutLoading();
}

final class LogoutSuccess extends UserState {
  const LogoutSuccess();
}
