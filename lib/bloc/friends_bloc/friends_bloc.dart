import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/api_strings.dart';
import 'package:untitled1/app_repository.dart';
import 'package:untitled1/headers.dart';
import 'package:untitled1/model/ask_question.dart';
import 'package:untitled1/model/friend_and_family_model.dart';
import 'package:http/http.dart' as http;
part 'friends_event.dart';
part 'friends_state.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  FriendsBloc() : super(FriendsInitial()) {
    on<GetFriendsListEvent>(_getFriendsList);
    on<UpdateFriendEvent>(_updateFriend);
    on<DeleteFriendEvent>(_deleteFriend);
  }
  AppRepository appRepository = AppRepository();

  @override
  void onTransition(Transition<FriendsEvent, FriendsState> transition) {
    debugPrint(transition.toString());
    super.onTransition(transition);
  }

  _updateFriend(UpdateFriendEvent event, Emitter<FriendsState> emit) async {
    http.post(
      ApiStrings.updateFriend(event.relatives.uuid!),
      headers: Headers.header,
    );
  }

  _deleteFriend(DeleteFriendEvent event, Emitter<FriendsState> emit) async {
    await http.post(
      ApiStrings.deleteFriend(event.uuid),
      headers: Headers.header,
    );
  }

  _getFriendsList(
    GetFriendsListEvent event,
    Emitter<FriendsState> emit,
  ) async {
    emit(FriendsLoading());
    FriendsAndFamilyModel friendsAndFamilyModel =
        await appRepository.getFriendList();
    if (friendsAndFamilyModel.success!) {
      debugPrint("if");
      emit(state.copyWith(friendsAndFamilyModel: friendsAndFamilyModel));
    } else {
      debugPrint("else");
      state.copyWith(success: false);
    }
  }
}
