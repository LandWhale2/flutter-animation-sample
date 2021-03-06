import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterui2/page/animation.dart';
import 'package:flutterui2/widget/FadeRoute.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.amber;
  double _width = 50;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  double _height = 50;
  bool _visible =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AnimatedOpacity(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                      ),
                    ),
                    opacity: _visible ? 1 : 0,
                    duration: Duration(milliseconds: 500),
                  ),
                  IconButton(
                    icon: Icon(Icons.play_circle_filled,size: 40,),
                    onPressed: (){
                      setState(() {
                        _visible = !_visible;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 100,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 150,
                    child: FadeInImage.assetNetwork(
                        placeholder: 'https://elysator.com/wp-content/uploads/blank-profile-picture-973460_1280-e1523978675847.png',
                        fadeInCurve: Curves.fastOutSlowIn,
                        image: 'http://newsroom.etomato.com/userfiles/181214hiteeyrrin.jpg'),
                  ),
                  IconButton(
                    icon: Icon(Icons.play_circle_filled,size: 40,),
                    onPressed: (){
                      setState(() {
                        Navigator.push(context, CustomRoute(builder: (_)=>SecondPage()));
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 100,),
            AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
              ),
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: 1),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_filled),
        onPressed: (){
          setState(() {
            final ramdom = Random();
            _width = ramdom.nextInt(300).toDouble();
            _height = ramdom.nextInt(300).toDouble();

            _color = Color.fromRGBO(
                ramdom.nextInt(256),
                ramdom.nextInt(256),
                ramdom.nextInt(256),
                1);

            _borderRadius = BorderRadius.circular(ramdom.nextInt(100).toDouble());
          });
        },
      ),
    );
  }
}
