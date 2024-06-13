import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationControls extends StatelessWidget {
  const NavigationControls({super.key, required this.webViewController});

  final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          onPressed: () async {
            /*WebViewCookieManager().clearCookies();
            WebViewCookieManager().setCookie(const WebViewCookie(name: "Sesion", value: "ID=", domain: ".frc.utn.edu.ar"));
            WebViewCookieManager().setCookie(const WebViewCookie(name: "AUTENTIFICADO", value: "", domain: "www.frc.utn.edu.ar"));
            WebViewCookieManager().setCookie(const WebViewCookie(name: "UNTFRC", value: "0", domain: "www.frc.utn.edu.ar"));
            WebViewCookieManager().setCookie(const WebViewCookie(name: "MoodleSession", value: "", domain: "www.frc.utn.edu.ar"));
            WebViewCookieManager().setCookie(const WebViewCookie(name: "SesionID", value: "", domain: ".frc.utn.edu.ar"));
            WebViewCookieManager().setCookie(const WebViewCookie(name: "MAXIMO", value: "", domain: "www.frc.utn.edu.ar"));
            WebViewCookieManager().setCookie(const WebViewCookie(name: "ASPSESSIONIDSCTDAABA", value: "PHFIPJEAHOCBGMINKGDAKLIM", domain: "www.frc.utn.edu.ar"));
            WebViewCookieManager().setCookie(const WebViewCookie(name: "usr", value: "", domain: "www.frc.utn.edu.ar"));
            WebViewCookieManager().setCookie(const WebViewCookie(name: "tipoUsuario", value: "", domain: "www.frc.utn.edu.ar"));
            WebViewCookieManager().setCookie(const WebViewCookie(name: "rec", value: "0", domain: "www.frc.utn.edu.ar"));
            WebViewCookieManager().setCookie(const WebViewCookie(name: "pag", value: "2", domain: ".frc.utn.edu.ar"));*/
            Navigator.popAndPushNamed(context, '/');
          }, 
          icon: const Column(
            children: [
              Text('Cerrar'),
              Text('Sesion')
            ],
          )),
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            if (await webViewController.canGoBack()) {
              await webViewController.goBack();
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No back history item')),
                );
              }
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () async {
            if (await webViewController.canGoForward()) {
              await webViewController.goForward();
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No forward history item')),
                );
              }
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () => webViewController.reload(),
        ),
      ],
    );
  }
  }