part of 'user_bloc.dart';

sealed class UserEvent {}

class SaveButtonClickedEvent extends UserEvent {
  final UserModel userModel;

  SaveButtonClickedEvent({required this.userModel});
}

class AllAgeSortEvent extends UserEvent {}

class ElderAgeSortEvent extends UserEvent {}

class YoungerAgeSortEvent extends UserEvent {}
