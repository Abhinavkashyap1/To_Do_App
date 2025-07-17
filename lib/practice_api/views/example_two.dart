import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/photos_model.dart';
class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  List<PhotosModel>photosList=[];
  Future<List<PhotosModel>>getPhotos()async{
    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data= jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        PhotosModel photos=PhotosModel(title: i['title'],url: i['url']);
        photosList.add(photos);
      }
      return photosList;
    }
    else{
      return photosList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('api practice'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context,snapshot){
              return ListView.builder(itemBuilder: (context,index){
                return ListTile(
                  title: Text('shivani'),
                );
              });
            }),
          ),
        ],
      ),
    );
  }
}
