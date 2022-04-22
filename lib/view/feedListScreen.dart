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
        child: ListView(
         children: [
           Container(
             height: 50,
             color: Colors.amber[600],
             child: const Center(child: Text('Entry A')),
           ),
           Container(
             height: 50,
             color: Colors.amber[500],
             child: const Center(child: Text('Entry B')),
           ),
           Container(
             height: 50,
             color: Colors.amber[400],
             child: const Center(child: Text('Entry C')),
           ),
           Container(
             height: 50,
             color: Colors.amber[300],
             child: const Center(child: Text('Entry D')),
           ),
           Container(
             height: 50,
             color: Colors.amber[200],
             child: const Center(child: Text('Entry E')),
           ),
           Container(
             height: 50,
             color: Colors.amber[100],
             child: const Center(child: Text('Entry F')),
           ),
         ],
        ),
      ),
    );
  }
}
