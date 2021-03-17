import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Data.dart';

Future<List<Data>> getAllData() async {
  var apiUrl = 'https://jsonplaceholder.typicode.com/photos';
  var data = await http.get(apiUrl);
  var jsonData = json.decode(data.body);

  List<Data> listofdata = [];

  for (var i in jsonData) {
    Data data = Data(
      id: i['id'],
      title: i['title'],
      url: i['url'],
      thumbnailUrl: i['thumbnailUrl'],
    );
    listofdata.add(data);
  }
  return listofdata;
}








List<MaterialColor> randomcolor = [
  Colors.green,
  Colors.blue,
  Colors.red,
  Colors.deepOrange,
  Colors.yellow,
  Colors.teal,
  Colors.blueGrey,
  Colors.brown,
  Colors.cyan
];
