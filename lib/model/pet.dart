class Pet {

  Pet (String name_, String imagePath_, List <bool> isFeed_, List <bool> isHappy_) {
    name = name_;
    imagePath = imagePath_;
    isFeed = isFeed_;
    isHappy = isHappy_;
  }

  String name = "Tom";
  String imagePath = "";
  List <bool> isFeed = [false, false, false, false, false];
  List <bool> isHappy = [false, false, false, false, false];
}