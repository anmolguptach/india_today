class FriendsAndFamilyModel {
  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  Data? data;

  FriendsAndFamilyModel({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.data,
  });

  FriendsAndFamilyModel.fromJson(Map<String, dynamic> json) {
    httpStatus = json['httpStatus'];
    httpStatusCode = json['httpStatusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['httpStatus'] = httpStatus;
    data['httpStatusCode'] = httpStatusCode;
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<AllRelatives>? allRelatives;

  Data({this.allRelatives});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['allRelatives'] != null) {
      allRelatives = <AllRelatives>[];
      json['allRelatives'].forEach((v) {
        allRelatives!.add(AllRelatives.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allRelatives != null) {
      data['allRelatives'] = allRelatives!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllRelatives {
  String? uuid;
  int? relationId;
  String? relation;
  String? firstName;
  String? middleName;
  String? lastName;
  String? fullName;
  String? gender;
  String? dateAndTimeOfBirth;
  BirthDetails? birthDetails;
  BirthPlace? birthPlace;

  AllRelatives(
      {this.uuid,
      this.relationId,
      this.relation,
      this.firstName,
      this.middleName,
      this.lastName,
      this.fullName,
      this.gender,
      this.dateAndTimeOfBirth,
      this.birthDetails,
      this.birthPlace});

  AllRelatives.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    relationId = json['relationId'];
    relation = json['relation'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    gender = json['gender'];
    dateAndTimeOfBirth = json['dateAndTimeOfBirth'];
    birthDetails = json['birthDetails'] != null
        ? BirthDetails.fromJson(json['birthDetails'])
        : null;
    birthPlace = json['birthPlace'] != null
        ? BirthPlace.fromJson(json['birthPlace'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['relationId'] = relationId;
    data['relation'] = relation;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    data['gender'] = gender;
    data['dateAndTimeOfBirth'] = dateAndTimeOfBirth;
    if (birthDetails != null) {
      data['birthDetails'] = birthDetails!.toJson();
    }
    if (birthPlace != null) {
      data['birthPlace'] = birthPlace!.toJson();
    }
    return data;
  }
}

class BirthDetails {
  int? dobYear;
  int? dobMonth;
  int? dobDay;
  int? tobHour;
  String? meridiem;
  int? tobMin;

  BirthDetails(
      {this.dobYear,
      this.dobMonth,
      this.dobDay,
      this.tobHour,
      this.meridiem,
      this.tobMin});

  BirthDetails.fromJson(Map<String, dynamic> json) {
    dobYear = json['dobYear'];
    dobMonth = json['dobMonth'];
    dobDay = json['dobDay'];
    tobHour = json['tobHour'];
    meridiem = json['meridiem'];
    tobMin = json['tobMin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dobYear'] = dobYear;
    data['dobMonth'] = dobMonth;
    data['dobDay'] = dobDay;
    data['tobHour'] = tobHour;
    data['meridiem'] = meridiem;
    data['tobMin'] = tobMin;
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
