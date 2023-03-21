import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'mobile_layout.dart';
import 'windows_layout.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00968A),
      ),
      body: SIForm(),
    );
  }
}
