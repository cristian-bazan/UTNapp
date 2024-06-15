import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utnfrc_mobile/Providers/utn_provider.dart';
import 'package:utnfrc_mobile/Shared_Preferences/preferences.dart';

class MyFormWidget extends StatefulWidget {
  const MyFormWidget({
    super.key,
    required GlobalKey<FormState> formKey, required String label, required this.keyboardType, required bool save, required TextEditingController controller,
  }) : _formKey = formKey, _label = label, _save = save, _controller = controller;

  final GlobalKey<FormState> _formKey;
  final String? _label;
  final TextInputType keyboardType;
  final bool _save;
  final TextEditingController _controller;

  @override
  State<MyFormWidget> createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {

  @override
  void initState() {
    super.initState();
    if (widget._label == 'Usuario') {
      widget._controller.text = Preferences.user;
    } else {
      widget._controller.text = Preferences.password;
    }
  }
  
  @override
  Widget build(BuildContext context) {

      return  Form(
        key: widget._formKey,
        child: 
      Column(children: [
            TextFormField(
              controller: widget._controller,
              keyboardType: widget.keyboardType,
              obscureText: widget._label=='Contraseña' ? true : false,
              onSaved: (value){
                if (widget._label == 'Usuario') {
                    context.read<UtnProvider>().setUser(value!);
                    if (widget._save) {
                      Preferences.setUser(value);
                    }
                  }else{
                    context.read<UtnProvider>().setPassword(value!);
                    if (widget._save) {
                      Preferences.setPassword(value);

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
                labelText: widget._label,
                suffixIcon: IconButton(
                  onPressed: (){
                    if (widget._label == 'Usuario') {
                      if (widget._controller.text != "") {
                        widget._controller.text = "";
                      } else {
                        widget._controller.text = Preferences.user;
                      }
                    } else {
                      if (widget._controller.text != "") {
                        widget._controller.text = "";
                      } else {
                        widget._controller.text = Preferences.password;
                      }
                    }
                    setState(() {});
                  },
                  icon: const Icon(Icons.close))
              ),
            )
          ],
        )
        );
  }
}
