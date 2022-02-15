import 'package:flutter/widgets.dart';

import '../enums/ScreenState.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  ViewState _truestate = ViewState.Idle;

  ViewState get truestate => _truestate;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setTrueState(ViewState viewState) {
    _truestate = viewState;
    notifyListeners();
  }

}
