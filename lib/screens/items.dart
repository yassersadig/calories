import 'package:calories/components/itemView.dart';
import 'package:calories/components/newItem.dart';
import 'package:calories/models/item.dart';
import 'package:calories/providers/itemProvider.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  
  void _showDialog() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BottomSheet(
              onClosing: (){}, builder: (BuildContext context) {
                return SizedBox(height:250,child:NewItem());
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Column(children: <Widget>[
        Container(
          color: Colors.green,
          child: Center(
              child: Text(
            'Items',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          )),
          height: 100.0,
          width: MediaQuery.of(context).size.width,
        ),
        FutureBuilder<List<Item>>(
            future: getAllItems(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Item item = snapshot.data[index];
                    return new ItemView(
                      itemName: item.name,
                      protein: item.protein,
                      calories: item.calories,
                    );
                  },
                ));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ]),
      Padding(
          padding: EdgeInsets.all(20.0),
          child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  onPressed: () {
                    _showDialog();
                  },
                  child: Icon(Icons.add))))
    ]);
  }
}
