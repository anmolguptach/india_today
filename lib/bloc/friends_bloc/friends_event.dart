part of 'friends_bloc.dart';

abstract class FriendsEvent extends Equatable {
  const FriendsEvent();

  @override
  List<Object> get props => [];
}

class GetFriendsListEvent extends FriendsEvent {}

class UpdateFriendEvent extends FriendsEvent {
  final AllRelatives relatives;
  const UpdateFriendEvent({required this.relatives});
}

class DeleteFriendEvent extends FriendsEvent {
  final String uuid;
  const DeleteFriendEvent({required this.uuid});
}
