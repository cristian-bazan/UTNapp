import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utnfrc_mobile/Pages/pages.dart';
import 'package:utnfrc_mobile/Providers/utn_provider.dart';
import 'package:utnfrc_mobile/Shared_Preferences/preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.getPrefs();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UtnProvider>(create: (_) => UtnProvider())
    ],
    child: const MyApp(),)
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTNFRC Mobile',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const StartPage(),
        '/page': (context) => const UtnPage()
      },
    );
  }
}