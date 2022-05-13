part of 'page_bloc.dart';

@immutable
class PageState {
  final bool isWorking;
  final String error;
  final String accion;
  final String actualPage;


  PageState({
    this.isWorking = false,
    this.error = '',
    this.accion = '',
    this.actualPage = '/home',
  });

  PageState copyWith({
    final bool? isWorking,
    final String? error,
    final String? accion,
    final String? actualPage,
  }) => 
  PageState(
    isWorking: isWorking ?? this.isWorking,
    error: error ?? this.error,
    accion: accion ?? this.accion,
    actualPage: actualPage ?? this.actualPage,
  );
}
