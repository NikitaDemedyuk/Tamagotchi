import 'package:equatable/equatable.dart';

class Pet extends Equatable {

  Pet (this.name, this.indexFeed, this.isFeed, this.indexHappy, this.isHappy);

  final String name;
  int indexFeed;
  List <bool> isFeed;
  int indexHappy;
  List <bool> isHappy;
  DateTime timeToFeed = DateTime.now();

  @override
  List<Object> get props => [name, isFeed, isHappy, timeToFeed];

}