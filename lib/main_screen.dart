import 'package:chugchug/Community/Community.dart';
import 'package:chugchug/MyPage.dart';
import 'package:chugchug/Quest/Quest.dart';
import 'package:chugchug/Shopping.dart';
import 'package:flutter/material.dart';
// import 'package:wave/config.dart';
// import 'package:wave/wave.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title : "CHUG-CHUG",
      home : MainPage(),
    );  
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{

    late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.repeat(reverse: true);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/ChugChug_Typo.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            SizedBox(width: 8), // Add spacing between image and text
            Text(
              'CHUG-CHUG',
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Fraunces",
                fontVariations: const <FontVariation>[FontVariation('wght', 700.0)],
              ),
            ),
          ],
        ),
        leading: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidget()));
              },
              icon: Icon(
                Icons.menu,
                size: 50,
                color: Colors.white,
              ),
              ),
      ),
      body: Stack(
        children: <Widget>[
        Container(
          width: double.infinity,
          height: 1300,
          color: Color(0xff6CA1F1).withOpacity(0.5),
        ),
        // WaveWidget(
        //       config: CustomConfig(
        //         gradients: [
        //           [Colors.blue, Colors.green],
        //           [Colors.green, Colors.blue],
        //         ],
        //         durations: [35000, 19440],
        //         heightPercentages: [0.20, 0.25],
        //         blur: MaskFilter.blur(BlurStyle.solid, 10),
        //         gradientBegin: Alignment.bottomLeft,
        //         gradientEnd: Alignment.topRight,
        //       ),
        //       waveAmplitude: 0,
        //       size: Size(
        //         double.infinity,
        //         double.infinity,
        //       ),
        //     ),
        //     Center(
        //       child: Text(
        //         '물결 효과',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 24.0,
        //         ),
        //       ),
        //     ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(
            'coral1.png',
            width: 300,
            height: 300,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'coral2.png',
            width: 300,
            height: 300,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            'coral3.png',
            width: 200,
            height: 200,
          ),
        ),
        Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 150.0),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 20 * _animation.value), // Adjust the amplitude of the wave
                    child: Image.asset(
                      'chugchug_character.png', // Replace with your character image path
                      width: 300, // Set the desired width
                      height: 300, // Set the desired height
                    ),
                  );
                }
              ),
            ),
        ),
        Column(
          children: [
            SizedBox(
              height: 510,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: 
              InkWell(
                onTap: () {
                  print("onPressed");
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(30), 
                    color: Color(0xff1B0FA3).withOpacity(0.9),
                    ),
                    child: (
                      Text(
                        "chugchug",
                        style:TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: "Fraunces",
                          fontVariations: const <FontVariation>[FontVariation('wght', 700.0)],
                          ),
                          textAlign: TextAlign.center,
                      )
                    ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            height : 150,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width : 100,
                      height: 100,
                      //color: Color(0xff1B0FA3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), 
                        color: Color(0xffb7b7b7).withOpacity(0.9),
                      ),
                      child: 
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => QuestPage()));
                        },
                        icon: Icon(
                          Icons.check_box,
                          size: 70),
                          ),
                    ),
                    Container(
                      width : 100,
                      height: 100,
                      //color: Color(0xff1B0FA3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), 
                        color: Color(0xff1B0FA3).withOpacity(0.9),
                      ),
                      child: 
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingPage()));

                        },
                        icon: Icon(
                          Icons.wallet_giftcard_rounded,
                          size: 70),
                        ),
                    ),
                    Container(
                      width : 100,
                      height: 100,
                      //color: Color(0xff1B0FA3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xff121212).withOpacity(0.9),
                      ),
                      child: 
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityPage()));
                        },
                        icon: Icon(
                          Icons.people,
                          size: 70,),
                          ),
                    ),
                  ]),
              ],
            ),
          ),
        )
      ],
      ),
    );
  }
}