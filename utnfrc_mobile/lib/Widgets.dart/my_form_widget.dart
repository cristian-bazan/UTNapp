import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utnfrc_mobile/Providers/utn_provider.dart';

class MyFormWidget extends StatelessWidget {
  const MyFormWidget({
    super.key,
    required GlobalKey<FormState> formKey, required String label, required this.keyboardType
  }) : _formKey = formKey, _label = label;

  final GlobalKey<FormState> _formKey;
  final String? _label;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: 
    Column(children: [
          TextFormField(
            keyboardType: keyboardType,
            initialValue: _label=='Contraseña' ? context.watch<UtnProvider>().getPassword() : context.watch<UtnProvider>().getUser(),
            obscureText: _label=='Contraseña' ? true : false,
            onSaved: (value){
              if (_label == 'Usuario') {
                  context.read<UtnProvider>().setUser(value!);
                }else{
                  context.read<UtnProvider>().setPassword(value!);
                }
            },
            validator: (value){
              if (value == null || value.isEmpty) {
                return 'Complete todos los campos';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: _label
            ),
          )
        ],
      )
      );
  }
}