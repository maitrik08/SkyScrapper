import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyscrapper/ForcastModel.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark;
  ThemeProvider({required this.isDark});
  changeTheme() async {
    isDark = !isDark;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('appTheme',isDark);
    notifyListeners();
  }
}
class CityProvider with ChangeNotifier {
  Future<void> saveCity(String cityName) async {
    City = cityName;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('city', City);
  }

  Future<void> loadCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    City = prefs.getString('city') ?? '';
    notifyListeners();
  }
}