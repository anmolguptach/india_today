import 'dart:convert';

class FriendPostModel {
  BirthDetails? birthDetails;
  BirthPlace? birthPlace;
  String? firstName;
  String? lastName;
  int? relationId;
  String? gender;

  FriendPostModel(
      {this.birthDetails,
      this.birthPlace,
      this.firstName,
      this.lastName,
      this.relationId,
      this.gender});

  FriendPostModel.fromJson(Map<String, dynamic> json) {
    birthDetails = json['birthDetails'] != null
        ? BirthDetails.fromJson(json['birthDetails'])
        : null;
    birthPlace = json['birthPlace'] != null
        ? BirthPlace.fromJson(json['birthPlace'])
        : null;
    firstName = json['firstName'];
    lastName = json['lastName'];
    relationId = json['relationId'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (birthDetails != null) {
      data['birthDetails'] = birthDetails!.toJson();
    }
    if (birthPlace != null) {
      data['birthPlace'] = birthPlace!.toJson();
    }
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['relationId'] = relationId;
    data['gender'] = gender;
    return data ;
  }
}

class BirthDetails {
  int? dobDay;
  int? dobMonth;
  int? dobYear;
  int? tobHour;
  int? tobMin;
  String? meridiem;

  BirthDetails(
      {this.dobDay,
      this.dobMonth,
      this.dobYear,
      this.tobHour,
      this.tobMin,
      this.meridiem});

  BirthDetails.fromJson(Map<String, dynamic> json) {
    dobDay = json['dobDay'];
    dobMonth = json['dobMonth'];
    dobYear = json['dobYear'];
    tobHour = json['tobHour'];
    tobMin = json['tobMin'];
    meridiem = json['meridiem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dobDay'] = dobDay;
    data['dobMonth'] = dobMonth;
    data['dobYear'] = dobYear;
    data['tobHour'] = tobHour;
    data['tobMin'] = tobMin;
    data['meridiem'] = meridiem;
    return data;
  }
}

class BirthPlace {
  String? placeName;
  String? placeId;

  BirthPlace({this.placeName, this.placeId});

  BirthPlace.fromJson(Map<String, dynamic> json) {
    placeName = json['placeName'];
    placeId = json['placeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['placeName'] = placeName;
    data['placeId'] = placeId;
    return data;
  }
}
