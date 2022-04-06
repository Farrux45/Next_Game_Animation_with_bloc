import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'bloc_state.dart';

class BlocPage extends Cubit<BlocState> {
  BlocPage() : super(BlocInitial());

  String text = "This is the sample text for Flutter TextScroll widget.";
  Color color = Colors.blue;
  List data = [];
  List tekshir = [];

  bool start = true;
  int random = 0;
  int result = 0;
  int timeCount = 5;
  List<Color> colors = [
    Colors.green,
    Colors.yellow,
    Colors.brown,
    Colors.blue,
    Colors.red
  ];

  List<String> names = [
    "Yashil",
    "Sariq",
    "Jigarrang",
    "Ko'k",
    "Qizil",
  ];

  void rangTanlang(index) {
    if (index == random) {
      emit(TextState());
      random = Random().nextInt(5);
      result += 1;
      timeCount = 5;
      timeGame();
    } else {
      start = true;
      emit(TextState());
    }
  }

  void startGame() {
    start = false;
    result = 0;
    emit(TextState());
  }

  timeGame() {
    for (var i = 0; i < 5; i++) {
      Future.delayed(Duration(seconds: i)).then((value) {
        timeCount--;
        emit(TextState());
      });
    }
  }

  void textChange(List name) {
    data = text.split("");
    print(data);
    for (var i = 0; i < data.length; i++) {
      if (data[i] == name[i]) {
        color = Colors.green;
        emit(TextState());
      }
    }
    emit(TextState());
  }

  void refresh() {
    data.clear();
    color = Colors.blue;
    emit(TextState());
  }
}
