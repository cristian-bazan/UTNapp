import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utnfrc_mobile/Providers/utn_provider.dart';
import 'package:utnfrc_mobile/Shared_Preferences/preferences.dart';

class MyFormWidget extends StatelessWidget {
  const MyFormWidget({
    super.key,
    required GlobalKey<FormState> formKey, required String label, required this.keyboardType, required bool save
  }) : _formKey = formKey, _label = label, _save = save;

  final GlobalKey<FormState> _formKey;
  final String? _label;
  final TextInputType keyboardType;
  final bool _save;

  @override
  Widget build(BuildContext context) {

    String user = '';
    String password= '';

    Preferences().getUser().then((result) {
      user = result.toString();
    });

    Preferences().getPassword().then((result) {
      password = result.toString();
    });
    //String password = Preferences().getPassword as String;

    return FutureBuilder(
      future: Preferences().getUser(),
      builder: (context, snapshot) {
      return  Form(
        key: _formKey,
        child: 
      Column(children: [
            TextFormField(
              keyboardType: keyboardType,
              initialValue: _label=='Contraseña' ? password : user,
              obscureText: _label=='Contraseña' ? true : false,
              onSaved: (value){
                if (_label == 'Usuario') {
                    context.read<UtnProvider>().setUser(value!);
                    if (_save) {
                      Preferences().setUser(value);
                    }
                  }else{
                    context.read<UtnProvider>().setPassword(value!);
                    if (_save) {
                      Preferences() .setPassword(value);
                    }
                  }
              },
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Complete todos los campos';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: _label,
                icon: IconButton(
                  onPressed: (){
                    _formKey.currentState!.reset();
                  },
                  icon: const Icon(Icons.close))
              ),
            )
          ],
        )
        );
  });
  }
}