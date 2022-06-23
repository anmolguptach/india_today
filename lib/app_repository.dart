import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled1/api_strings.dart';
import 'package:untitled1/headers.dart';
import 'package:untitled1/model/ask_question.dart';
import 'package:untitled1/model/friend_and_family_model.dart';
import 'package:untitled1/model/friends_post_model.dart';

class AppRepository {
  Future getQuestionList() async {
    http.Response json = await http.get(ApiStrings.getQuestionList);
    AskAQuestionModel askAQuestionModel =
        AskAQuestionModel.fromJson(jsonDecode(json.body));
    return askAQuestionModel;
  }

  Future getFriendList() async {
    http.Response json =
        await http.get(ApiStrings.getFriendFamilyList, headers: Headers.header);
    FriendsAndFamilyModel friendsAndFamilyModel =
        FriendsAndFamilyModel.fromJson(jsonDecode(json.body));
    return friendsAndFamilyModel;
  }

  Future postFriend(FriendPostModel friendPostModel) async {
    http.Response json = await http.post(
      ApiStrings.postFriend,
      headers: Headers.header,
      body: friendPostModel.toJson(),
    );
    FriendsAndFamilyModel friendsAndFamilyModel =
        FriendsAndFamilyModel.fromJson(jsonDecode(json.body));
    return friendsAndFamilyModel;
  }
}
