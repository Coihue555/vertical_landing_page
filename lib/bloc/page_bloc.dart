import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageState()) {

    on<OnGoToPageCtrl>(_onGoToPageCtrl);
  }

  Future<void> _onGoToPageCtrl(OnGoToPageCtrl event, Emitter emit) async {
    emit(state.copyWith(
      isWorking: true,
      accion: 'OnGoToPageCtrl',
      error: '',
      scrollController: PageController(),
    ));

    final PageController scrollCtrl= PageController(initialPage: event.index);

    scrollCtrl.animateToPage(
      event.index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut
    );

    
    emit(state.copyWith(
      isWorking: false,
      accion: 'OnGoToPageCtrl',
      error: '',
      scrollController: scrollCtrl,
    ));
  }






}
