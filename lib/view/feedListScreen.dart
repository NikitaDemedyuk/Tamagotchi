import 'package:flutter/material.dart';

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
