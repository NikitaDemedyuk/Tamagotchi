import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Will be implemented later',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Avenir',
          ),
        ),
      ),
    );
  }
}
