part of 'add_new_profile_bloc.dart';

abstract class AddNewProfileEvent extends Equatable {
  const AddNewProfileEvent();

  @override
  List<Object> get props => [];
}

class PostNewProfile extends AddNewProfileEvent {
  final Function() onTap;
  const PostNewProfile({required this.onTap});
}

class NameChanged extends AddNewProfileEvent {
  final String name;
  const NameChanged({required this.name});
}

class PlaceOfBirthChanged extends AddNewProfileEvent {
  final String placeOfBirth;
  const PlaceOfBirthChanged({required this.placeOfBirth});
}

class DOBDateChanged extends AddNewProfileEvent {
  final int dobDate;
  const DOBDateChanged({required this.dobDate});
}

class DOBMonthChanged extends AddNewProfileEvent {
  final int dobMonth;
  const DOBMonthChanged({required this.dobMonth});
}

class DOBYearChanged extends AddNewProfileEvent {
  final int dobYear;
  const DOBYearChanged({required this.dobYear});
}

class TOBHourChanged extends AddNewProfileEvent {
  final int tobHour;
  const TOBHourChanged({required this.tobHour});
}

class TOBMinChanged extends AddNewProfileEvent {
  final int tobMin;
  const TOBMinChanged({required this.tobMin});
}

class AMPMStatusChanged extends AddNewProfileEvent {
  final bool isAm;
  const AMPMStatusChanged({required this.isAm});
}

class GenderChanged extends AddNewProfileEvent {
  final String gender;
  const GenderChanged({required this.gender});
}

class RelationChanged extends AddNewProfileEvent {
  final String relation;
  const RelationChanged({required this.relation});
}

class SetAddNewProfileView extends AddNewProfileEvent {
  final bool value;
  const SetAddNewProfileView({required this.value});
}
