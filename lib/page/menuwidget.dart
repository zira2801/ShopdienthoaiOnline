import 'package:flutter/material.dart';
import 'package:shop/component/mainheader.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
      const  MainHeader(),
        Expanded(child: Container(

        ))
      ],
    )) ;
  }
}
