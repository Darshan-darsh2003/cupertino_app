import 'package:flutter/cupertino.dart';

class ThemeProvider with ChangeNotifier {
  Brightness _currentBrightness = Brightness.light;

  Brightness get currentBrightness => _currentBrightness;

  void toggleTheme() {
    _currentBrightness = _currentBrightness == Brightness.light
        ? Brightness.dark
        : Brightness.light;
    notifyListeners();
  }
}
