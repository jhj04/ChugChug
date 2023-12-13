import 'package:chugchug/Community.dart';
import 'package:chugchug/MyPage.dart';
import 'package:chugchug/Quest/Quest.dart';
import 'package:flutter/material.dart';

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
      appBar: 
      PreferredSize(
        preferredSize: Size.fromHeight(
          70.0
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children : [
        AppBar(
            // elevation: 0,
            //centerTitle: false,
            //title: Image.asset('assets/chugchug.png', fit: BoxFit.contain, height: 80,),
            backgroundColor:Color(0xffF5F5F5),
            
            leading: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidget()));
              },
              icon: Icon(
                Icons.menu,
                size: 50,
              ),
              ),
            
        ),
        // SizedBox(
        //   height: 10,
        // )
      ],
      ),),
      body: Stack(
        children: <Widget>[
        Container(
          width: double.infinity,
          height: 1000,
          color: Color(0xffF5F5F5),
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
                        "척척이",
                        style:TextStyle(
                          color: Colors.white,
                          fontSize: 30,
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
                          
                        },
                        icon: Icon(
                          Icons.search,
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
                  // SizedBox(
                  //   height: 50,
                  // ),
              ],
            ),
          ),
        )
      ],
      ),
    );
  }
}