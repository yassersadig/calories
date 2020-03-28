import 'package:calories/components/itemView.dart';
import 'package:calories/models/item.dart';
import 'package:calories/providers/itemProvider.dart';
import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(color: Colors.green, child: Center(child:Text('Items',style: TextStyle(fontWeight:FontWeight.bold,fontSize:30),)),height: 100.0,width: MediaQuery.of(context).size.width,),
      Container(
          child: FutureBuilder<List<Item>>(
            future: getAllItems(),



        builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Item item = snapshot.data[index];
                return new ItemView(itemName: item.name,protein: item.protein,calories: item.calories,);
              
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }})
    )]);
  }
}
