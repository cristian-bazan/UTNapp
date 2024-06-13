import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utnfrc_mobile/Providers/utn_provider.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key, required this.formKeyUser, required this.formKeyPassword, required this.sesion, required this.selection,
  });
  final GlobalKey<FormState> formKeyUser;
  final GlobalKey<FormState> formKeyPassword;
  final String sesion;
  final String selection;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        if (formKeyUser.currentState!.validate() && formKeyPassword.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')),);
                        context.read<UtnProvider>().setSelection(selection);
                        formKeyUser.currentState!.save();
                        formKeyPassword.currentState!.save();
                        Navigator.popAndPushNamed(context, '/page');
                      }
      }, 
      child: Text('Ingresar $sesion')
      );
  }
}
/*
if (_formKeyUser.currentState!.validate() && _formKeyPassword.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')),);
                        UtnProvider().user = _formKeyUser.toString();
                        UtnProvider().password = _formKeyPassword.toString();
                        Navigator.pushNamed(context, '/page');
                      }
*/