part of 'login_bloc.dart';

sealed class LoginEvent {}

final class GetOptEvent extends LoginEvent {
  final String phoneNumber;
  final BuildContext context;

  GetOptEvent({required this.phoneNumber, required this.context});
}

final class VerifyButtonEvent extends LoginEvent {
  final String otp;
  final String vid;
  final BuildContext context;
  VerifyButtonEvent(
      {required this.otp, required this.vid, required this.context});
}
