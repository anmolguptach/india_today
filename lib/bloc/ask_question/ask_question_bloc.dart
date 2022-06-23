import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/app_repository.dart';
import 'package:untitled1/model/ask_question.dart';

part 'ask_question_event.dart';
part 'ask_question_state.dart';

class AskQuestionBloc extends Bloc<AskQuestionEvent, AskQuestionState> {
  AskQuestionBloc() : super(AskQuestionLoading()) {
    on<GetAllQuestionEvent>(_getQuestionFromApi);
    on<UpdateDropDownValueEvent>(_updateCategoryList);
  }

  AppRepository appRepository = AppRepository();
  List<String> categoryList = [];

  @override
  void onTransition(Transition<AskQuestionEvent, AskQuestionState> transition) {
    debugPrint(transition.toString());
    super.onTransition(transition);
  }

  void _updateCategoryList(
    UpdateDropDownValueEvent event,
    Emitter<AskQuestionState> emit,
  ) {
    emit(state.copyWith(currentIndex: event.value));
  }

  void _getQuestionFromApi(
    GetAllQuestionEvent event,
    Emitter<AskQuestionState> emit,
  ) async {
    AskAQuestionModel askAQuestionModel = await appRepository.getQuestionList();
    if (askAQuestionModel.success == true &&
        askAQuestionModel.httpStatusCode == 200) {
      for (var element in askAQuestionModel.data!) {
        categoryList.add(element.name!);
      }
      emit(
        state.copyWith(
          askAQuestionModel: askAQuestionModel,
          categoryList: categoryList,
          currentIndex: 0,
        ),
      );
    } else {
      emit(AskQuestionState(askAQuestionModel: askAQuestionModel));
    }
  }
}
