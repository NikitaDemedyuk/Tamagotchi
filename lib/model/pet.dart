import 'package:equatable/equatable.dart';

class Pet extends Equatable {

  Pet (this.name, this.imagePath, this.isFeed, this.isHappy);

  final String name;
  final String imagePath;
  int indexFeed = 0;
  List <bool> isFeed;
  int indexHappy = 0;
  List <bool> isHappy;

  @override
  List<Object> get props => [name, imagePath, isFeed, isHappy];

}