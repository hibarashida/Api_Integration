import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addtodoScreen.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed:() {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => AddScreen(),));
      },
      child: Icon(Icons.add),),
      body: ListView.builder(
        itemBuilder: (context,index) {
          return Container(
            height: 100,
            width: 150,
            color: Colors.blueGrey,
          );
        }
      ),
    );
  }
}
