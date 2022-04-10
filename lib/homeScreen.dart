import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:tamagotchi/main.dart';
import 'package:tamagotchi/theme/theme_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final List _isFeed = [false, false, false, false, false];
  int index = 0;

  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: 2.0, end: 15.0).animate(animationController)..addListener(() {
      setState(() {

      });
    });
    animationController.repeat(reverse: true);
    animationController.forward();

  }

  void _toggleFeed(int index) {
    setState(() {
      if (!_isFeed[index]) {
        _isFeed[index] = true;
      }
    });
  }

  void _togglePlay(int index) {
    setState(() {
      if (_isFeed[index]) {
        _isFeed[index] = false;
      }
    });
  }

  Widget iconsSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _isFeed[0] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
            _isFeed[1] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
            _isFeed[2] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
            _isFeed[3] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
            _isFeed[4] ? Icon(Icons.fastfood) : Icon(Icons.fastfood_outlined),
          ],
        ),
      ],
    );
  }

  Widget imageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            //color: Colors.black,
            padding: EdgeInsets.all(10.0),
            child: iconsSection(),
          ),
        ),
        Expanded(
          flex: 3,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                'images/ben2011.webp',
                fit: BoxFit.fill,
              ),
              Positioned(
                right: 100.0,
                bottom: 130.0,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(
                      color: Color.fromARGB(130, 237, 125, 58),
                      blurRadius: animation.value,
                      spreadRadius: animation.value,
                    )]
                  ),
                  child: ElevatedButton(
                      onPressed: (){
                        if (index == 4) {
                          _toggleFeed(index);
                          ++index;
                        }
                        if (index < 4) {
                          _toggleFeed(index);
                          _toggleFeed(index + 1);
                          index += 2;
                        }
                      },
                      child: null,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber.withOpacity(0.01),
                        shape: CircleBorder(),
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buttonAction(IconData iconInButton, double width, double height,
      double sizeIcon, int indexButton) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        shape: CircleBorder(),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Icon(
          iconInButton,
          size: sizeIcon,
        ),
      ),
      onPressed: () {
        if (indexButton == 1) {
          if (index == 0) {
            _togglePlay(index);
          } else if (index > 0) {
            --index;
            _togglePlay(index);
          }
        } else if (indexButton == 2) {
          if (index < 5) {
            _toggleFeed(index);
            ++index;
          }
        }
      },
    );
  }

  Widget buttonSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonAction(Icons.videogame_asset, 70, 70, 35.0, 1),
        buttonAction(Icons.set_meal_rounded, 90, 90, 40.0, 2),
        buttonAction(Icons.videocam, 70, 70, 35.0, 3),
      ],
    );
  }

  Widget buttonsColumn() {
    return Container(
      padding: const EdgeInsets.all(10),
      //color: Colors.amber,
      child: buttonSection(),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('TAMAGOTCHI'),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: buttonsColumn(),
            ),
            Expanded(
              flex: 3,
              child: imageSection(),
            ),
          ],
        ),
      ),
    );
  }
}
