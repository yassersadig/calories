import 'package:flutter/material.dart';

class ItemView extends StatefulWidget {
  final String itemName;
  final int protein;
  final int calories;

  ItemView({this.itemName,this.protein,this.calories});

  @override
  State<StatefulWidget> createState() {
    return ItemViewState(this.itemName,this.protein,this.calories);
  }
}

class ItemViewState extends State<ItemView> {
  String itemName = '';
  int protein = 0;
  int calories = 0;

  ItemViewState(this.itemName,this.protein,this.calories);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(width: 1.0, color: Colors.grey))),
      child: Row(children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 8.0, right: 24.0),
            width: 40.0,
            height: 40.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        'https://via.placeholder.com/40x40.png')))),
        SizedBox(
          width: 150.0,
          child: Text(
            itemName,
          ),
        ),
        SizedBox(
            width: 90.0,
            child: Text(
              protein.toString(),
              textAlign: TextAlign.center,
            )),
        SizedBox(
            width: 90.0,
            child: Text(
              calories.toString(),
              textAlign: TextAlign.center,
            )),
      ]),
    );
  }
}
