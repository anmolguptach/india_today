part of 'add_new_profile_bloc.dart';

class AddNewProfileState extends Equatable {
  final bool? dobDayStatus;
  final bool? nameStatus;
  final bool? dobMonthStatus;
  final bool? dobYearStatus;
  final bool? tobHourStatus;
  final bool? tobMinStatus;
  final bool? placeStatus;
  final bool? isAm;

  const AddNewProfileState({
    this.dobDayStatus = false,
    this.dobMonthStatus = false,
    this.dobYearStatus = false,
    this.nameStatus = false,
    this.placeStatus = false,
    this.tobHourStatus = false,
    this.tobMinStatus = false,
    this.isAm = false,
  });

  AddNewProfileState copyWith({
    final bool? dobDayStatus,
    final bool? nameStatus,
    final bool? dobMonthStatus,
    final bool? dobYearStatus,
    final bool? tobHourStatus,
    final bool? tobMinStatus,
    final bool? placeStatus,
    final bool? isAm,
  }) {
    return AddNewProfileState(
      dobDayStatus: dobDayStatus ?? this.dobDayStatus,
      dobMonthStatus: dobMonthStatus ?? this.dobMonthStatus,
      dobYearStatus: dobYearStatus ?? this.dobYearStatus,
      nameStatus: nameStatus ?? this.nameStatus,
      placeStatus: placeStatus ?? this.placeStatus,
      tobHourStatus: tobHourStatus ?? this.tobHourStatus,
      tobMinStatus: tobMinStatus ?? this.tobMinStatus,
      isAm: isAm ?? this.isAm,
    );
  }

  @override
  List<Object?> get props => [
        dobYearStatus,
        dobMonthStatus,
        dobDayStatus,
        tobMinStatus,
        tobHourStatus,
        placeStatus,
        nameStatus,
        isAm,
      ];
}

class AddNewProfileInitial extends AddNewProfileState {}
