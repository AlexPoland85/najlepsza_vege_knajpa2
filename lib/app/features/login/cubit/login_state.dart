part of 'login_cubit.dart';

@immutable
class LoginState {
  final String errorMessage;
  final bool isCreatingAccount;
  final bool login;
  final bool isLoading;
  final String email;
  final String password;

  const LoginState({
    required this.errorMessage,
    required this.isCreatingAccount,
    required this.login,
    required this.isLoading,
    required this.email,
    required this.password,
  });
}
