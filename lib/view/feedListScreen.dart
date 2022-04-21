import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homeScreen.dart';

class FeedListScreen extends StatefulWidget {
  const FeedListScreen({Key? key}) : super(key: key);

  @override
  State<FeedListScreen> createState() => _FeedListScreenState();
}

class _FeedListScreenState extends State<FeedListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Avenir',
          ),
        ),
      ),
    );
  }
}
