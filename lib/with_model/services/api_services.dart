import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../practice_api/model/post_model.dart';

class ApiServices{
  /// with model
  Future<PostModel?>getSinglePost()async{
    try{
      
      var response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
      if(response.statusCode==200){
        PostModel model=PostModel.fromJson(jsonDecode(response.body));
        return model;
      }

    }catch(e){
      print(e.toString());
    }

}
}
