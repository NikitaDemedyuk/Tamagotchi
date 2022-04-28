import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamagotchi/providers/pet_provider.dart';

import '../bloc/pet_bloc.dart';
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
        child: StreamBuilder<List<DateTime>>(
            stream: benBloc.feedList,
            builder: (context, snapshot) {
              ben.pet.feedList = snapshot.data ?? [];
              return 
                //Container(
                //padding: EdgeInsets.all(20.0),
                //child: Text(
                  //'${snapshot.data}',
                  //textAlign: TextAlign.center,
                //),
              //);
            }
        ),
      ),
    );
  }
}
