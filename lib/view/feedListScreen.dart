import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamagotchi/providers/pet_provider.dart';

import '../bloc/pet_bloc.dart';

class FeedListScreen extends StatefulWidget {
  const FeedListScreen({Key? key}) : super(key: key);

  @override
  State<FeedListScreen> createState() => _FeedListScreenState();
}


class _FeedListScreenState extends State<FeedListScreen> {

  @override
  Widget build(BuildContext context) {

    PetBloc petBloc = Provider.of<PetProvider>(context).petBloc;

    DateTime dateToday = DateTime( DateTime.now().year,
                                   DateTime.now().month,
                                   DateTime.now().day,
                                   DateTime.now().hour,
                                   DateTime.now().minute,
                                   DateTime.now().second
                              );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           ElevatedButton(
               style: ButtonStyle(
               ),
               onPressed: () async {
                 petBloc.savePreferences();
               },
               child: null
           ),
           StreamBuilder<int>(
               stream: petBloc.indexFeed,
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
