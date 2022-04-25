import 'package:equatable/equatable.dart';

class Pet extends Equatable {

  Pet (this.name, this.isFeed, this.isHappy);

  final String name;
  int indexFeed = 0;
  List <bool> isFeed;
  int indexHappy = 0;
  List <bool> isHappy;
  DateTime timeToFeed = DateTime.now();

  @override
  List<Object> get props => [name, isFeed, isHappy, timeToFeed];

}