part of 'page_bloc.dart';

@immutable
abstract class PageEvent {

}

class OnGoToPageCtrl extends PageEvent {
  final int index;
  OnGoToPageCtrl(this.index);
}