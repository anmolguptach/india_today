part of 'ask_question_bloc.dart';

@immutable
abstract class AskQuestionEvent {}

class GetAllQuestionEvent extends AskQuestionEvent {}
class LoadingEvent extends AskQuestionEvent {}

class UpdateDropDownValueEvent extends AskQuestionEvent {
  final int value;
  UpdateDropDownValueEvent(this.value);
}

class UpdateModelEvent extends AskQuestionEvent {
  final AskAQuestionModel askAQuestionModel;
  UpdateModelEvent(this.askAQuestionModel);
}

class UpdateCategoryListEvent extends AskQuestionEvent {
  final List<String> list;
  UpdateCategoryListEvent(this.list);
}
