import 'package:shared_preferences/shared_preferences.dart';
import 'package:utnfrc_mobile/Shared_Preferences/encoder.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static String user = "";
  static String password = "";
  static final Encoder _encoder = Encoder();

  // *********** GETS ************

  static Future getPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void getUser() async {
    String value = "";
    
    List<String>? userList = _prefs.getStringList('user');

    if (userList==null || userList.isEmpty) {
    } else {
      value = _encoder.decode(userList);
    }
    user = value;
  }

  static void getPassword() async {
    String value = "";
    List<String>? passwordList = _prefs.getStringList('password');

    if (passwordList==null || passwordList.isEmpty) {
    } else {
      value = _encoder.decode(passwordList);
    }
    password = value;
  }

  // *********** SETS ************


  static void setUser(String user) async {
    List<String>? userList =_encoder.encode(user);
    _prefs.setStringList('user', userList);
    getUser();
  }

  static void setPassword(String password) async {
     List<String>? passwordList =_encoder.encode(password);
    _prefs.setStringList('password', passwordList);
    getPassword();
  }

}