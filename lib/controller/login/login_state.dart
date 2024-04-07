part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class GetOtpSuccessState extends LoginState {
  final String vid;

  GetOtpSuccessState({required this.vid});
}

final class GetOtpFailedState extends LoginState {
  final String exp;

  GetOtpFailedState({required this.exp});
}

final class OtpVerifiedSuccessState extends LoginState {}
