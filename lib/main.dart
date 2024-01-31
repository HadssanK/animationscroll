import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Myhome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {

  List data =["Apple","Banana","Mango","Orange","lemon","graphs"];
  List colors = [Colors.purple,Colors.deepOrange,Colors.deepOrange,Colors.brown,Colors.yellow,Colors.green];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Column(
        children: [
          SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ListView.builder(
              shrinkWrap: true,
              physics:  ScrollPhysics(),
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      currentindex=index;
                    });
                  },
                  child: AnimatedContainer(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 120,
                    height: 10,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: currentindex==index?Border.all(color: Colors.white):Border.all(color: Colors.black),
                      color: currentindex==index?Colors.black38:Colors.transparent,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    duration: Duration(seconds: 1),
                    curve: Curves.bounceOut,

                    child: Text(data[index],style: TextStyle(color: currentindex==index? Colors.white:Colors.black),),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30,),
          Container(
            width: 300,
            height: 200,
              color:colors[currentindex],
            child: Center(child: Text(data[currentindex])),
          )

        ],
      ),
    );
  }
}



