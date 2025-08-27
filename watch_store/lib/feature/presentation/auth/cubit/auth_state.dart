part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}
final class AuthLoadingState extends AuthState {}
final class AuthErrorState extends AuthState {}
final class AuthSendState extends AuthState {}
final class AuthVerifyIsRegisterState extends AuthState {}
final class AuthVerifyState extends AuthState {}
final class LoggedInState extends AuthState {}
final class LoggedOutState extends AuthState {}
