part of 'ask_question_bloc.dart';

class AskQuestionState extends Equatable {
  final AskAQuestionModel? askAQuestionModel;
  final List<String>? categoryList;
  final int? currentIndex;
  const AskQuestionState(
      {this.askAQuestionModel, this.categoryList, this.currentIndex});

  AskQuestionState copyWith(
      {final AskAQuestionModel? askAQuestionModel,
      final List<String>? categoryList,
      final int? currentIndex}) {
    return AskQuestionState(
      currentIndex: currentIndex ?? this.currentIndex,
      askAQuestionModel: askAQuestionModel ?? this.askAQuestionModel,
      categoryList: categoryList ?? this.categoryList,
    );
  }

  @override
  List<Object?> get props => [askAQuestionModel, categoryList, currentIndex];
}

class AskQuestionLoading extends AskQuestionState {}
// class AskQuestionInitial extends AskQuestionState {
//   @override
//   List<Object?> get props => [];
// }
//
// class AskQuestionSuccess extends AskQuestionState {
//   final AskAQuestionModel? askAQuestionModel;
//   final List<String>? categoryList;
//   final String? dropDownValue;
//   AskQuestionSuccess(
//       {this.askAQuestionModel, this.categoryList, this.dropDownValue});
//
//   @override
//   List<Object?> get props => [askAQuestionModel];
// }
//
// class AskQuestionFail extends AskQuestionState {
//   final AskAQuestionModel askAQuestionModel;
//   AskQuestionFail(this.askAQuestionModel);
//
//   @override
//   List<Object?> get props => [askAQuestionModel];
// }
