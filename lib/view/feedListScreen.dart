import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
              return GridView.count(
                crossAxisCount: 1,
                children: List.generate(ben.pet.feedList.length, (index) {
                  return Center(
                    child: Text(
                      '${ben.pet.feedList[index]}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  );
                }),
              );
            }),
      ),
    );
  }
}
