import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamagotchi/providers/pet_provider.dart';

import '../bloc/pet_bloc.dart';

class FeedListScreen extends StatefulWidget {
  const FeedListScreen({Key? key}) : super(key: key);

  @override
  State<FeedListScreen> createState() => _FeedListScreenState();
}

PetBloc petBloc = PetBloc();

class _FeedListScreenState extends State<FeedListScreen> {

  @override
  Widget build(BuildContext context) {

    petBloc = Provider.of<PetProvider>(context).petBloc;

    DateTime dateToday = DateTime( DateTime.now().year,
                                   DateTime.now().month,
                                   DateTime.now().day,
                                   DateTime.now().hour,
                                   DateTime.now().minute,
                                   DateTime.now().second
                              );

    return Scaffold(
      body: Center(
        child: ListView(
         children: [
           ElevatedButton(
               onPressed: () async {
                 petBloc.savePreferencesFeed();
               },
               child: null
           ),
           StreamBuilder<DateTime>(
              stream: petBloc.timeToFeed,
               builder: (context, snapshot) {
                  return Text(
                     '${snapshot.data}'
                 );
               }
           ),
         ],
        ),
      ),
    );
  }
}
