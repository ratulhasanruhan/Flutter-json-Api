import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_parsing/details_page.dart';
import 'Model/Data.dart';
import 'Model/main_system.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Parsing App'),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Ratul Hasan'),
              accountEmail: Text('ratulhasan1644@gmail.com'),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
            ),
            ListTile(
              title: Text('Drawer Menu 1'),
              leading: Icon(
                Icons.animation,
                color: Colors.lightBlueAccent,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              title: Text('Drawer Menu 2'),
              leading: Icon(
                Icons.list,
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Drawer Menu 3'),
              leading: Icon(
                Icons.http,
                color: Colors.deepOrangeAccent,
              ),
            ),
            ListTile(
              title: Text('Drawer Menu 4'),
              leading: Icon(
                Icons.ad_units_outlined,
                color: Colors.greenAccent,
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Close'),
              subtitle: Text('All menu is for dmeo Design'),
              leading: Icon(
                Icons.close,
                color: Colors.indigoAccent,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            margin: EdgeInsets.all(10),
            child: FutureBuilder(
              future: getAllData(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.data == null) {
                  return Center(child: Text('Loading Data...'));
                } else {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        MaterialColor mColor =
                            randomcolor[index % randomcolor.length];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details(index)));
                          },
                          child: Card(
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  snapshot.data[index].url,
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: CircleAvatar(
                                        backgroundColor: mColor,
                                        foregroundColor: Colors.white,
                                        child: Text(
                                            snapshot.data[index].id.toString()),
                                      ),
                                    ),
                                    Container(
                                        width: 80,
                                        child: Text(
                                          snapshot.data[index].title,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: mColor,
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ),
          SizedBox(height: 7),
          Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10),
            child: FutureBuilder(
                future: getAllData(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.data == null) {
                    return Center(child: Text('Loading list Data...'));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          MaterialColor mColor =
                              randomcolor[index % randomcolor.length];

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details(index)));
                            },
                            child: Card(
                              elevation: 7,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Image.network(
                                      snapshot.data[index].thumbnailUrl,
                                      height: 70,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(snapshot.data[index].title),
                                  ),
                                  Expanded(
                                    child: CircleAvatar(
                                      foregroundColor: Colors.white,
                                      backgroundColor: mColor,
                                      child: Text(
                                          snapshot.data[index].id.toString()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
