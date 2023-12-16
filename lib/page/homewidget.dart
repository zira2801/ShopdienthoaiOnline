import 'package:flutter/material.dart';
import 'package:shop/component/mainheader.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Center(
      child: Column(
        children: [
          MainHeader(),
        ],
      ),
    ));
  }
}