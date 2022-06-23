import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/api_strings.dart';
import 'package:untitled1/headers.dart';
import 'package:untitled1/model/friends_post_model.dart';

part 'add_new_profile_event.dart';
part 'add_new_profile_state.dart';

class AddNewProfileBloc extends Bloc<AddNewProfileEvent, AddNewProfileState> {
  AddNewProfileBloc() : super(AddNewProfileInitial()) {
    on<AddNewProfileEvent>((event, emit) {});
    on<NameChanged>(_nameChanged);
    on<DOBDateChanged>(_dobDateChanged);
    on<DOBMonthChanged>(_dobMonthChanged);
    on<DOBYearChanged>(_dobYearChanged);
    on<TOBHourChanged>(_tobHourChanged);
    on<TOBMinChanged>(_tobMinChanged);
    on<PlaceOfBirthChanged>(_placeChanged);
    on<AMPMStatusChanged>(_amPmChanged);
    on<GenderChanged>(_genderChanged);
    on<RelationChanged>(_relationChanged);
    on<PostNewProfile>(_postNewProfile);
  }

  static final RegExp nameRegExp = RegExp('[a-zA-Z]');

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobDateController = TextEditingController();
  final TextEditingController dobMonthController = TextEditingController();
  final TextEditingController dobYearController = TextEditingController();
  final TextEditingController tobHourController = TextEditingController();
  final TextEditingController tobMonthController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  String gender = "Male";
  String relation = " Mother in Law";
  void _genderChanged(GenderChanged event, Emitter<AddNewProfileState> emit) {
    debugPrint(gender);
    gender = event.gender;
    debugPrint(event.gender);
  }

  void _relationChanged(
      RelationChanged event, Emitter<AddNewProfileState> emit) {
    debugPrint(relation);
    relation = event.relation;
    debugPrint(event.relation);
  }

  _postNewProfile(
      PostNewProfile event, Emitter<AddNewProfileState> emitter) async {
    FriendPostModel friendPostModel = FriendPostModel(
      birthDetails: BirthDetails(
        dobDay: int.parse(dobDateController.text),
        dobMonth: int.parse(dobMonthController.text),
        dobYear: int.parse(dobYearController.text),
        tobMin: int.parse(tobMonthController.text),
        tobHour: int.parse(tobHourController.text),
        meridiem: state.isAm! ? "AM" : "PM",
      ),
      birthPlace: BirthPlace(
        placeName: placeController.text,
        placeId: "ChIJwTa3v_6nkjkRC_b2yajUF_M",
      ),
      lastName: "",
      relationId: 10,
      firstName: nameController.text,
      gender: gender,
    );
    await http
        .post(ApiStrings.postFriend,
            headers: Headers.header, body: jsonEncode(friendPostModel.toJson()))
        .then((value) {
      event.onTap();
    });
  }
  _updateProfile(
      PostNewProfile event, Emitter<AddNewProfileState> emitter) async {
    FriendPostModel friendPostModel = FriendPostModel(
      birthDetails: BirthDetails(
        dobDay: int.parse(dobDateController.text),
        dobMonth: int.parse(dobMonthController.text),
        dobYear: int.parse(dobYearController.text),
        tobMin: int.parse(tobMonthController.text),
        tobHour: int.parse(tobHourController.text),
        meridiem: state.isAm! ? "AM" : "PM",
      ),
      birthPlace: BirthPlace(
        placeName: placeController.text,
        placeId: "ChIJwTa3v_6nkjkRC_b2yajUF_M",
      ),
      lastName: "",
      relationId: 10,
      firstName: nameController.text,
      gender: gender,
    );
    await http
        .post(ApiStrings.postFriend,
            headers: Headers.header, body: jsonEncode(friendPostModel.toJson()))
        .then((value) {
      event.onTap();
    });
  }

  void _nameChanged(NameChanged event, Emitter<AddNewProfileState> emit) {
    emit(state.copyWith(nameStatus: nameRegExp.hasMatch(event.name)));
  }

  void _amPmChanged(AMPMStatusChanged event, Emitter<AddNewProfileState> emit) {
    emit(state.copyWith(isAm: event.isAm));
  }

  void _dobDateChanged(DOBDateChanged event, Emitter<AddNewProfileState> emit) {
    bool _value = event.dobDate > 0 ? true : false;
    emit(state.copyWith(dobDayStatus: _value));
  }

  void _dobMonthChanged(
      DOBMonthChanged event, Emitter<AddNewProfileState> emit) {
    bool _value = event.dobMonth > 0 ? true : false;

    emit(state.copyWith(dobMonthStatus: _value));
  }

  void _dobYearChanged(DOBYearChanged event, Emitter<AddNewProfileState> emit) {
    bool _value = event.dobYear > 0 && event.dobYear.toString().length == 4
        ? true
        : false;

    emit(state.copyWith(dobYearStatus: _value));
  }

  void _tobHourChanged(TOBHourChanged event, Emitter<AddNewProfileState> emit) {
    bool _value = event.tobHour > 0 ? true : false;

    emit(state.copyWith(tobHourStatus: _value));
  }

  void _tobMinChanged(TOBMinChanged event, Emitter<AddNewProfileState> emit) {
    bool _value = event.tobMin > 0 ? true : false;

    emit(state.copyWith(tobMinStatus: _value));
  }

  void _placeChanged(
      PlaceOfBirthChanged event, Emitter<AddNewProfileState> emit) {
    emit(state.copyWith(placeStatus: nameRegExp.hasMatch(event.placeOfBirth)));
  }
}
