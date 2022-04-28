import 'package:equatable/equatable.dart';

class Pet extends Equatable {

  Pet (this.name, this.indexFeed, this.isFeed, this.indexHappy, this.isHappy, this.feedList);

  final String name;
  int indexFeed;
  List <bool> isFeed;
  int indexHappy;
  List <bool> isHappy;
  DateTime timeToFeed = DateTime.now();
  List <DateTime> feedList;

  @override
  List<Object> get props => [name, indexFeed, isFeed, indexHappy, isHappy, timeToFeed, feedList];

}