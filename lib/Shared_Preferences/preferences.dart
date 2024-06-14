
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utnfrc_mobile/Shared_Preferences/encoder.dart';

class Preferences {

  late Encoder _encoder;

  Preferences(){
    _encoder = Encoder();
  }

  // *********** GETS ************

  Future<String> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? userList = prefs.getStringList('user');

    if (userList==null || userList.isEmpty) {
      return '';
    } else {
      String user = _encoder.decode(userList);
      return user;
    }
    
  }

  Future<String> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? passwordList= prefs.getStringList('password');

    if (passwordList==null || passwordList.isEmpty) {
      return '';
    } else {
      String password = _encoder.decode(passwordList);
      return password;
    }

  }

  // *********** SETS ************


  Future<void> setUser(String user) async {
    List<String>? userList =_encoder.encode(user);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('user', userList);
  }

  Future<void> setPassword(String password) async {
     List<String>? passwordList =_encoder.encode(password);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('password', passwordList);
  }

}