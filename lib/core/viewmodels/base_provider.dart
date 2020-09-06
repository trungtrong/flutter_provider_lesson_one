import 'package:flutter/material.dart';
import 'package:flutter_provider_lesson_one/core/enums/viewstate.dart';

class BaseProvider extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}