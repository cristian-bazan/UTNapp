import 'package:flutter/material.dart';
import 'package:utnfrc_mobile/Widgets.dart/widgets.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  final _formKeyUser = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    FocusScopeNode f = FocusScope.of(context);
    bool isSave = false;

    return GestureDetector(
      onTap: () {    
        if (!f.hasPrimaryFocus) {
          f.unfocus();
          }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          title: const MyTitleAppBar(title: 'UTNFRC-Mobile',),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children:[ 
                const Center(
                  child: Opacity(
                        opacity: 0.1,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Image(image: AssetImage('assets/UTNFRC.png')),
                        ),
                      ),
                ),
                Column(children: [
                  MyFormWidget(formKey: _formKeyUser, label: 'Usuario', keyboardType: TextInputType.number),
                  const SizedBox(height: 8),
                  MyFormWidget(formKey: _formKeyPassword, label: 'Contraseña', keyboardType: TextInputType.text),
                  const SizedBox(height: 8),
                  CheckboxListTile(
                    title: const Text("Recordar"),
                    value: isSave, 
                    onChanged: (bool? value){
                      setState(() {
                        isSave = value!;
                      });
                    }),
                  const SizedBox(height: 8),
                  const MyDropdownMenu(),
                  const SizedBox(height: 8),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyElevatedButton(formKeyUser: _formKeyUser, formKeyPassword: _formKeyPassword, sesion: "Autogestion", selection: "chk2",),
                          MyElevatedButton(formKeyUser: _formKeyUser, formKeyPassword: _formKeyPassword, sesion: "UV", selection: "chk6",),
                        ],
                      ),
                    ),
                    
                ],
              ),]
            ),
          ),
        ),
      ),
    );
  }
}