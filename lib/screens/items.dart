import 'package:calories/models/item.dart';
import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(color: Colors.green, child: Center(child:Text('Items',style: TextStyle(fontWeight:FontWeight.bold,fontSize:30),)),height: 100.0,width: MediaQuery.of(context).size.width,),
      Container(
          child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ItemView('long name', 100, 200),
          ItemView('more longer name', 100, 200),
          ItemView('the longest name ever', 100, 200)
        ],
      ))
    ]);
  }
}
