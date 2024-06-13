import 'package:flutter/material.dart';
import 'package:utnfrc_mobile/Providers/utn_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

WebViewController controllerParameters = WebViewController()
..setJavaScriptMode(JavaScriptMode.unrestricted)
..setBackgroundColor(const Color(0x00000000))
..setNavigationDelegate(
  NavigationDelegate(
    onProgress: (int progress){},
    onPageStarted: (String url) {},
    onPageFinished: (String url) {
      if (url.contains('https://www.frc.utn.edu.ar/logon.frc')) {
        //completer();
      }
    },
    onHttpError: (HttpResponseError error) {},
    onWebResourceError: (WebResourceError error) {},
    onNavigationRequest: (NavigationRequest request){
      if (request.url.contains('https://www.frc.utn.edu.ar/logon.frc')) {
        //completer();
      }
      return NavigationDecision.navigate;
    }
  )
)
..loadRequest(Uri.parse('https://www.frc.utn.edu.ar/logon.frc${UtnProvider().generatePage()}'))
;
//error:https://www.frc.utn.edu.ar/logon.frc?user=user&password=password&dominio=dominio$selection

Future<void> completer2(){

    return controllerParameters.runJavaScript(
      '''
function GetParameters(param){
  var url = window.location.href.slice(window.location.href.indexOf('?') + 1)
    .split('&')
    for(var i = 0; i< url.length; i++){
      var urlParam = url[i].split('=')
      if(urlParam[0] == param){
          return urlParam[1]
}}}
var user = GetParameters("user")
var password = GetParameters("password")
var dominio = GetParameters("dominio")
var selection = GetParameters("selection")
document.getElementById("txtUsuario").value = ${UtnProvider().getUser()}
document.getElementById("pwdClave").value = password
document.getElementById("txtDominios").value = dominio
if(selection == "chk2"){
document.getElementById("chk2").click()
}else{
document.getElementById("chk6").click()
}
      ''');
  }
  Future<void> completer(WebViewController ctrlr)async {
  ctrlr.runJavaScript(
    '''
function GetParameters(param){
  var url = window.location.href.slice(window.location.href.indexOf('?') + 1)
    .split('&')
    for(var i = 0; i< url.length; i++){
      var urlParam = url[i].split('=')
      if(urlParam[0] == param){
          return urlParam[1]
}}}
var user = GetParameters("user")
var password = GetParameters("password")
var dominio = GetParameters("dominio")
var selection = GetParameters("selection")
document.getElementById("txtUsuario").value = ${UtnProvider().getUser()}
document.getElementById("pwdClave").value = password
document.getElementById("txtDominios").value = dominio
if(selection == "chk2"){
document.getElementById("chk2").click()
}else{
document.getElementById("chk6").click()
}
      ''');}