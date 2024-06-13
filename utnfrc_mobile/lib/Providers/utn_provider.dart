import 'package:flutter/foundation.dart';

class UtnProvider extends ChangeNotifier{
  late String _user;
  late String _password;
  late String _dominio;
  late String _selection;

  void setUser(String user){
    _user = user;
  }

  String getUser() => _user;

  void setPassword(String password){
    _password = password;
  }

  String getPassword() => _password;

  void setDominio(String dominio){
    _dominio = dominio;
  }

  String getDominio() => _dominio;

  void setSelection (String selection){
    _selection = selection;
  }

  String getSelection() => _selection;
  
UtnProvider(){
  _user = '';
  _password = '';
  _dominio = 'frc';
  _selection = '';
}

  String generatePage(){
    return "?user=$_user&password=$_password&dominio=$_dominio&selection=$_selection";
  }
}