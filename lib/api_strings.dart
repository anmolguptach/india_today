class ApiStrings {
  ApiStrings._();

  static Uri getQuestionList =
      Uri.parse("https://staging-api.astrotak.com/api/question/category/all");
  static Uri getFriendFamilyList =
      Uri.parse("https://staging-api.astrotak.com/api/relative/all");
  static Uri postFriend =
      Uri.parse("https://staging-api.astrotak.com/api/relative");

  static updateFriend(String uuid) {
    return Uri.parse(
        "https://staging-api.astrotak.com/api/relative/update/$uuid");
  }

  static deleteFriend(String uuid) {
    return Uri.parse(
        "https://staging-api.astrotak.com/api/relative/delete/$uuid");
  }
}
