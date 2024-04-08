part of 'user_bloc.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class UserAddedState extends UserState {
  final List<UserModel> usermodel;

  UserAddedState({required this.usermodel});
}

final class AllAgeGroupSuccessState extends UserState {
  final List<UserModel> userList;

  AllAgeGroupSuccessState({required this.userList});
}

final class ElderAgeGroupSuccessState extends UserState {
  final List<UserModel> userList;

  ElderAgeGroupSuccessState({required this.userList});
}

final class YoungerAgeGroupSuccessState extends UserState {
  final List<UserModel> userList;

  YoungerAgeGroupSuccessState({required this.userList});
}

final class SearchSuccessState extends UserState {
  final List<UserModel> searchList;

  SearchSuccessState({required this.searchList});
}
