part of 'bloc_page.dart';

@immutable
abstract class BlocState {}

class BlocInitial extends BlocState {}


class TextState extends BlocState {
  TextState();
}