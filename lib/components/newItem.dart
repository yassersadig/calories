import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:network_to_file_image/network_to_file_image.dart';

class NewItem extends StatefulWidget {
  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        GestureDetector(
            child: Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                width: 100.0,
                height: 100.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkToFileImage(
                          file: _image,
                          url: 'https://via.placeholder.com/100x100.png'),
                    ))),
            onTap: () {
              getImage();
            }),
        Container(
            width: 200,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Item Name',
                border: OutlineInputBorder(),
              ),
            )),
            Container(margin: EdgeInsets.only(bottom:8.0),),
        Row(
          children: <Widget>[
            Container(
                width: 200,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Calories',
                    border: OutlineInputBorder(),
                  ),
                )),
                Expanded(child: Container(),),
            Container(
                width: 200,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Protein',
                    border: OutlineInputBorder(),
                  ),
                )),
          ],
        )
      ]),
    );
  }
}
