import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with SingleTickerProviderStateMixin{
  double _value = 0.5;
  AnimationController controller;
  Animation<double> animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


//    controller = AnimationController(
//      duration: Duration(seconds: 3), vsync: this)..addListener(() =>
//    setState((){}));
//
//    animation = Tween(begin: -500, end: 500).animate(controller);
//    controller.forward();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100,),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 50,
                  onPressed: (){
                    Navigator.pop(context);
                  },),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
                IconButton(
                  icon: Icon(Icons.play_circle_filled),
                  iconSize: 50,
                  onPressed: (){
                    setState(() {
                      _value = 1;
                    });
                  },),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
