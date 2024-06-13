import 'package:flutter/material.dart';

class MyTitleAppBar extends StatefulWidget {
  const MyTitleAppBar({
    super.key, required this.title,
  });
  final String title;

  @override
  State<MyTitleAppBar> createState() => _MyTitleAppBarState();
}

class _MyTitleAppBarState extends State<MyTitleAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.title=="UTNFRC" ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
      children:[
        Text(widget.title),
        const CircleAvatar(
          child: Image(
            image: AssetImage('assets/UTN-full.png')))
      ]);
  }
}