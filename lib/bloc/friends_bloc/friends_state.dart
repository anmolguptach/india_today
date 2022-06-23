part of 'friends_bloc.dart';

class FriendsState extends Equatable {
  final FriendsAndFamilyModel? friendsAndFamilyModel;
  final bool success;
  const FriendsState({this.friendsAndFamilyModel, this.success= true});

  FriendsState copyWith(
      {final FriendsAndFamilyModel? friendsAndFamilyModel,
      final bool? success}) {
    return FriendsState(
      friendsAndFamilyModel:
          friendsAndFamilyModel ?? this.friendsAndFamilyModel,
      success: success ?? this.success,
    );
  }

  @override
  List<Object?> get props => [friendsAndFamilyModel, success];
}

class FriendsInitial extends FriendsState {}

class FriendsLoading extends FriendsState {}
