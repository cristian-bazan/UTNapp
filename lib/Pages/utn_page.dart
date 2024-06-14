import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utnfrc_mobile/Providers/utn_provider.dart';
import 'package:utnfrc_mobile/Widgets.dart/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UtnPage extends StatefulWidget {
  const UtnPage({super.key});

  @override
  State<UtnPage> createState() => _UtnPageState();
  
}
class _UtnPageState extends State<UtnPage> {

  late WebViewController _controller;

  @override
  void initState() {
    super.initState();  
    _controller = WebViewController()
..setJavaScriptMode(JavaScriptMode.unrestricted)
..setBackgroundColor(const Color(0x00000000))
..setNavigationDelegate(
  NavigationDelegate(
    onProgress: (int progress){},
    onUrlChange: (change) {
    },
    onPageStarted: (String url) {},
    onPageFinished: (String url) {
      if (url.contains('logon.frc')) {
        _controller.runJavaScript(
          '''
          \$(document).ready(function(){
          function GetParameters(param){
            var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&')
              for(var i = 0; i< url.length; i++){
                var urlParam = url[i].split('=')
                if(urlParam[0] == param){
                    return urlParam[1]
          }}}
          var user = GetParameters("user")
          var password = GetParameters("password")
          var dominio = GetParameters("dominio")
          var selection = GetParameters("selection")

          document.getElementById(selection).click()
          document.getElementById("txtUsuario").value = user
          document.getElementById("pwdClave").value = password
          document.getElementById("txtDominios").value = dominio

          document.getElementById("btnEnviar").click()
          })
          '''
        );
      }
    }));
    WebViewCookieManager().clearCookies();
  }

  @override
  Widget build(BuildContext context) {

    
    _controller.loadRequest(Uri.parse('https://www.frc.utn.edu.ar/logon.frc${context.watch<UtnProvider>().generatePage()}'));
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const MyTitleAppBar(title: 'UTNFRC',),
        actions: <Widget>[
          NavigationControls(webViewController: _controller),
        ],
      ),
      body: WebViewWidget(
        controller: _controller,
        ),
    );
  }
}