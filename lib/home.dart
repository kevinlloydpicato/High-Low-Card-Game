import 'package:flutter/material.dart';
import 'game.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:animated_button/animated_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future openDialogHelp() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('How to Play',textAlign: TextAlign.center, style: TextStyle (fontFamily: 'Rajdhani',fontSize: 30)),
        content: const Text('1. A card is shown and the player has to guess if the next card is >, < or = to the current card.'
        '\n2. Aces are considered to have a value of 1, Jack=11, Queen= 12, King= 13.'
          '\n3. If the user guesses correctly, they get points.If they get it wrong, the game ends.', textAlign: TextAlign.justify,),
        actions: [
          Center(
            child: TextButton(
              child: const Text('Ok'),
              onPressed: () {Navigator.pop(context);},
            ),
          ),
        ],
      ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(content: Text('Tap back again to exit')),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/balasa.webp'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Logos.png',
                    ),
                    scale: 3.0,
                    alignment: Alignment(-0.005, -0.6),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const SizedBox(height: 120,),
                      AnimatedButton(
                        width: 100,
                        color: Colors.transparent,
                        onPressed: () {Navigator.pushReplacement(context, FadeRoute(page: GamePage()));},
                        child: Image.asset('assets/buttons/play.png', scale: 4.0,),
                      ),

                      const SizedBox(height: 10,),
                      AnimatedButton(
                        width: 100,
                        color: Colors.transparent,
                        onPressed: () {openDialogHelp();},
                        child: Image.asset('assets/buttons/help.png', scale: 4.0,),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FadeRoute extends PageRouteBuilder {
  //custom fade animation to use when switching pages
  final Widget page;

  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
