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

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          80.0
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
      ],
      ),),
      body: Stack(children: <Widget>[
        Container(
          width: double.infinity,
          height: 1000,
          color: Color(0xffF5F5F5),
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
      ]),

    );
  }
}