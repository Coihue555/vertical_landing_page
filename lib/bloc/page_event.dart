part of 'page_bloc.dart';

@immutable
abstract class PageEvent {

}

class OnGoToPageCtrl extends PageEvent {
  final String index;
  OnGoToPageCtrl(this.index);
}