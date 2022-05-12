part of 'page_bloc.dart';

@immutable
class PageState {
  final bool isWorking;
  final String error;
  final String accion;
  final PageController scrollController;


  PageState({
    this.isWorking = false,
    this.error = '',
    this.accion = '',
    PageController? scrollController,
  })
  : scrollController = scrollController ?? PageController();

  PageState copyWith({
    final bool? isWorking,
    final String? error,
    final String? accion,
    final PageController? scrollController,
  }) => 
  PageState(
    isWorking: isWorking ?? this.isWorking,
    error: error ?? this.error,
    accion: accion ?? this.accion,
    scrollController: scrollController ?? this.scrollController
  );
}
