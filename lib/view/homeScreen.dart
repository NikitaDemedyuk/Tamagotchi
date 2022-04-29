import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamagotchi/providers/pet_provider.dart';
import '../bloc/pet_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

PetProvider ben = PetProvider();
PetBloc benBloc = PetBloc();

class _HomeScreenState extends State<HomeScreen> {
  Widget imageSection() {
    return Image.asset(
      'images/ben2011.webp',
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    ben = Provider.of<PetProvider>(context);
    benBloc = Provider.of<PetProvider>(context).petBloc;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StreamBuilder<List<bool>>(
                    stream: benBloc.isHappy,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();
                      ben.pet.isHappy = snapshot.data ?? [];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Happy bar',
                            style: TextStyle(fontSize: 20, fontFamily: 'Arial'),
                          ),
                          ben.pet.isHappy[0]
                              ? const Icon(Icons.emoji_emotions)
                              : const Icon(Icons.emoji_emotions_outlined),
                          ben.pet.isHappy[1]
                              ? const Icon(Icons.emoji_emotions)
                              : const Icon(Icons.emoji_emotions_outlined),
                          ben.pet.isHappy[2]
                              ? const Icon(Icons.emoji_emotions)
                              : const Icon(Icons.emoji_emotions_outlined),
                          ben.pet.isHappy[3]
                              ? const Icon(Icons.emoji_emotions)
                              : const Icon(Icons.emoji_emotions_outlined),
                          ben.pet.isHappy[4]
                              ? const Icon(Icons.emoji_emotions)
                              : const Icon(Icons.emoji_emotions_outlined),
                          StreamBuilder<int>(
                              stream: benBloc.indexHappy,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) return Container();
                                ben.pet.indexHappy = snapshot.data ?? 0;
                                return Text('${snapshot.data}');
                              })
                        ],
                      );
                    }
                  ),
                  StreamBuilder<List<bool>>(
                      stream: benBloc.isFeed,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return Container();
                        ben.pet.isFeed = snapshot.data ?? [];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Feed bar',
                              style:
                                  TextStyle(fontSize: 20, fontFamily: 'Arial'),
                            ),
                            ben.pet.isFeed[0]
                                ? const Icon(Icons.fastfood)
                                : const Icon(Icons.fastfood_outlined),
                            ben.pet.isFeed[1]
                                ? const Icon(Icons.fastfood)
                                : const Icon(Icons.fastfood_outlined),
                            ben.pet.isFeed[2]
                                ? const Icon(Icons.fastfood)
                                : const Icon(Icons.fastfood_outlined),
                            ben.pet.isFeed[3]
                                ? const Icon(Icons.fastfood)
                                : const Icon(Icons.fastfood_outlined),
                            ben.pet.isFeed[4]
                                ? const Icon(Icons.fastfood)
                                : const Icon(Icons.fastfood_outlined),
                            StreamBuilder<int>(
                                stream: benBloc.indexFeed,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) return Container();
                                  ben.pet.indexFeed = snapshot.data ?? 0;
                                  return Text('${snapshot.data}');
                                }),
                          ],
                        );
                      }),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(70, 70),
                              shape: const CircleBorder(),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.videogame_asset,
                                size: 35.0,
                              ),
                            ),
                            onPressed: () async {
                              ben.decrementFeed();
                              benBloc.changeIndexFeedPet(ben.pet.indexFeed);
                              benBloc.savePreferencesIndexFeed();
                              benBloc.changeArrayFeed(ben.pet.isFeed);
                              benBloc.savePreferencesIsFeed();
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(90, 90),
                              shape: const CircleBorder(),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.set_meal_rounded,
                                size: 40.0,
                              ),
                            ),
                            onPressed: () async {
                              ben.incrementFeed();
                              benBloc.changeIndexFeedPet(ben.pet.indexFeed);
                              benBloc.savePreferencesIndexFeed();
                              benBloc.changeArrayFeed(ben.pet.isFeed);
                              benBloc.savePreferencesIsFeed();
                              ben.addElementToFeed(DateTime.now());
                              benBloc.changeFeedTimeList(ben.feedList);
                              benBloc.savePreferencesFeedTimeList();
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(50, 50),
                              shape: const CircleBorder(),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.highlight_remove,
                                size: 30.0,
                              ),
                            ),
                            onPressed: () async {
                              ben.resetData();
                              benBloc.changeIndexFeedPet(ben.pet.indexFeed);
                              benBloc.savePreferencesIndexFeed();
                              benBloc.changeArrayFeed(ben.pet.isFeed);
                              benBloc.savePreferencesIsFeed();
                              benBloc.changeIndexHappyPet(ben.pet.indexHappy);
                              benBloc.savePreferencesIndexHappy();
                              benBloc.changeArrayHappy(ben.pet.isHappy);
                              benBloc.savePreferencesIsHappy();
                              benBloc.changeFeedTimeList(ben.pet.feedList);
                              benBloc.savePreferencesFeedTimeList();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        imageSection(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: AvatarGlow(
                            glowColor: Colors.red,
                            duration: Duration(seconds: 5),
                            child: ElevatedButton(
                              onPressed: () {
                                ben.decrementHappy();
                                benBloc.changeIndexHappyPet(ben.pet.indexHappy);
                                benBloc.savePreferencesIndexHappy();
                                benBloc.changeArrayHappy(ben.pet.isHappy);
                                benBloc.savePreferencesIsHappy();
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red.withOpacity(0.01),
                                shape: const CircleBorder(),
                              ),
                            ),
                            endRadius: 90,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: AvatarGlow(
                            glowColor: Colors.red,
                            duration: Duration(seconds: 5),
                            child: ElevatedButton(
                              onPressed: () {
                                ben.decrementHappy();
                                benBloc.changeIndexHappyPet(ben.pet.indexHappy);
                                benBloc.savePreferencesIndexHappy();
                                benBloc.changeArrayHappy(ben.pet.isHappy);
                                benBloc.savePreferencesIsHappy();
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red.withOpacity(0.01),
                                shape: const CircleBorder(),
                              ),
                            ),
                            endRadius: 120,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AvatarGlow(
                            glowColor: Colors.green,
                            duration: Duration(seconds: 2),
                            child: ElevatedButton(
                              onPressed: () {
                                ben.incrementHappy();
                                benBloc.changeIndexHappyPet(ben.pet.indexHappy);
                                benBloc.savePreferencesIndexHappy();
                                benBloc.changeArrayHappy(ben.pet.isHappy);
                                benBloc.savePreferencesIsHappy();
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green.withOpacity(0.01),
                                shape: const CircleBorder(),
                              ),
                            ),
                            endRadius: 60,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: AvatarGlow(
                            glowColor: Colors.amber,
                            duration: Duration(seconds: 3),
                            child: ElevatedButton(
                              onPressed: () {
                                ben.incrementFeed();
                                benBloc.changeIndexFeedPet(ben.pet.indexFeed);
                                benBloc.savePreferencesIndexFeed();
                                benBloc.changeArrayFeed(ben.pet.isFeed);
                                benBloc.savePreferencesIsFeed();
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.amber.withOpacity(0.01),
                                shape: const CircleBorder(),
                              ),
                            ),
                            endRadius: 100,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: AvatarGlow(
                            glowColor: Colors.green,
                            duration: Duration(seconds: 2),
                            child: ElevatedButton(
                              onPressed: () {
                                ben.incrementHappy();
                                benBloc.changeIndexHappyPet(ben.pet.indexHappy);
                                benBloc.savePreferencesIndexHappy();
                                benBloc.changeArrayHappy(ben.pet.isHappy);
                                benBloc.savePreferencesIsHappy();
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green.withOpacity(0.01),
                                shape: const CircleBorder(),
                              ),
                            ),
                            endRadius: 70,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: AvatarGlow(
                            glowColor: Colors.green,
                            duration: Duration(seconds: 2),
                            child: ElevatedButton(
                              onPressed: () {
                                ben.incrementHappy();
                                benBloc.changeIndexHappyPet(ben.pet.indexHappy);
                                benBloc.savePreferencesIndexHappy();
                                benBloc.changeArrayHappy(ben.pet.isHappy);
                                benBloc.savePreferencesIsHappy();
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green.withOpacity(0.01),
                                shape: const CircleBorder(),
                              ),
                            ),
                            endRadius: 70,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: AvatarGlow(
                            glowColor: Colors.red,
                            duration: Duration(seconds: 5),
                            child: ElevatedButton(
                              onPressed: () {
                                ben.decrementHappy();
                                benBloc.changeIndexHappyPet(ben.pet.indexHappy);
                                benBloc.savePreferencesIndexHappy();
                                benBloc.changeArrayHappy(ben.pet.isHappy);
                                benBloc.savePreferencesIsHappy();
                              },
                              child: null,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red.withOpacity(0.01),
                                shape: const CircleBorder(),
                              ),
                            ),
                            endRadius: 110,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
