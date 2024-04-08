import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:total_x/model/user_model.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<SaveButtonClickedEvent>(aveButtonClickedEvent);
    on<AllAgeSortEvent>(allAgeSortEvent);
    on<ElderAgeSortEvent>(elderAgeSortEvent);
    on<YoungerAgeSortEvent>(youngerAgeSortEvent);
  }

  List<UserModel> userList = [];

  FutureOr<void> aveButtonClickedEvent(
      SaveButtonClickedEvent event, Emitter<UserState> emit) {
    userList.add(event.userModel);
    emit(UserAddedState(usermodel: userList));
  }

  FutureOr<void> allAgeSortEvent(
      AllAgeSortEvent event, Emitter<UserState> emit) {
    emit(AllAgeGroupSuccessState(userList: userList));
  }

  FutureOr<void> elderAgeSortEvent(
      ElderAgeSortEvent event, Emitter<UserState> emit) {
    List<UserModel> elderAgeList =
        userList.where((user) => user.age >= 60).toList();
    emit(ElderAgeGroupSuccessState(userList: elderAgeList));
  }

  FutureOr<void> youngerAgeSortEvent(
      YoungerAgeSortEvent event, Emitter<UserState> emit) {
    List<UserModel> youngerAgeList =
        userList.where((user) => user.age < 60).toList();
    emit(YoungerAgeGroupSuccessState(userList: youngerAgeList));
  }
}
