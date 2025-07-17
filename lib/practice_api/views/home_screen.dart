import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/practice_api/views/example_two.dart';

import '../model/post_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel>postList=[];
  Future<List<PostModel>>getPostApi()async{
    final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'),);
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
   ///   Step 1: Loop through all the data from API
      for(Map<String,dynamic> i in data){
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    }
    else{
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Welcome',style: TextStyle(color: Colors.white,fontSize: 21),),
            Spacer(),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder:(context) => ExampleTwo(),),
                );
              },
                child: Text('Next',
                style: TextStyle(color: Colors.purple,fontSize: 18),)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getPostApi(),
                  builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator(),);
                }else{
                  return ListView.builder(
                    itemCount: postList.length,
                      itemBuilder: (context,index){
                   return Card(
                     child: Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                       Text('Title',style: TextStyle(color: Colors.purple,fontSize: 16),),
                       SizedBox(height: 10,),
                       Text(postList[index].title.toString()),
                       SizedBox(height: 10,),
                       Text('Description',style: TextStyle(color: Colors.purple,fontSize: 16),),
                       Text(postList[index].title.toString())
                         ],
                       ),
                     ),
                   );
                  });
                }
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
