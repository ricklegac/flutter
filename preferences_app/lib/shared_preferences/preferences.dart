import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  //todos los getter setter estatico
  static late SharedPreferences _prefs; //late apara iniciarlo mas tarde

  static String _name = '';
  static bool _isDarkmode = false;
  static int _gender = 1;

  static Future init() async { //cuando llamo al init() ya podre tener los datos guardados !
    _prefs = await SharedPreferences.getInstance();
     
  }

  static String get name {
    return _prefs.getString('name') ?? _name;
  }
  static set name(String name){
    _name = name;
    _prefs.setString('name', name);
  }

  static bool get isDarkmode{
    return _prefs.getBool('isDarkmode') ?? _isDarkmode;

  }
  static set isDarkmode(bool isDarkmode){
    _isDarkmode = isDarkmode;
    _prefs.setBool('isDarkmode', isDarkmode);
  }

}