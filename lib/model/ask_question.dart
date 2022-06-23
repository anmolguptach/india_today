class AskAQuestionModel {
  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  List<Data>? data;

  AskAQuestionModel(
      {this.httpStatus,
        this.httpStatusCode,
        this.success,
        this.message,
        this.data});

  AskAQuestionModel.fromJson(Map<String, dynamic> json) {
    httpStatus = json['httpStatus'];
    httpStatusCode = json['httpStatusCode'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['httpStatus'] = httpStatus;
    data['httpStatusCode'] = httpStatusCode;
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? price;
  String? description;
  List<String>? suggestions;

  Data({this.id, this.name, this.price, this.description, this.suggestions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    suggestions = json['suggestions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['suggestions'] = suggestions;
    return data;
  }
}
