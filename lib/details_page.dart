import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Model/main_system.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();

  int number;
  Details(this.number);
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details of ${widget.number + 1}'),
        ),
        body: FutureBuilder(
            future: getAllData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.data == null) {
                return Center(child: Text('Loading list Data...'));
              } else {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      color: Colors.cyan,
                      child: Image.network(
                        snapshot.data[widget.number].url,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data[widget.number].title,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 50,
                      foregroundColor: Colors.white,
                      child: Image.network(
                        snapshot.data[widget.number].thumbnailUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              }
            }));
  }
}
