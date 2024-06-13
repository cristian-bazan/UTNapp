
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utnfrc_mobile/Providers/utn_provider.dart';

class MyDropdownMenu extends StatefulWidget {
  const MyDropdownMenu({
    super.key,
  });

  @override
  State<MyDropdownMenu> createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    
    const List<String> dominiosList = <String>
    ['cbasicas','civil','computos','decanato','egresado','electrica','electronica','extension','industrial','mecanica',
    'metalurgica','org','posgrado','punilla','quimica','radio','sa','sae','scdt','sistemas','tecnicatura','virtual','frc'];
    String dropdownValue = context.watch<UtnProvider>().getDominio();

    return DropdownMenu(
      initialSelection: dropdownValue,
      //icon: const Icon(Icons.arrow_downward),
      dropdownMenuEntries: dominiosList.map<DropdownMenuEntry<String>>((String listValue){
        return DropdownMenuEntry<String>(
          value: listValue,
          label: listValue
          );
      }).toList(), 
      onSelected: (String? value) {
        dropdownValue = value!;
        context.read<UtnProvider>().setDominio(value);
        setState(() {});
      },
      );
  }
}