import 'dart:convert';
import 'dart:developer'; // Make sure to import the developer library for log()
import 'package:http/http.dart' as http;
import 'package:poppinroadcimema/Models/ChatModel.dart';
import 'package:poppinroadcimema/services/api_const.dart';

class ApiService {
  static Future<List<ChatModel>> getModels() async {
    var response = await http.get(
      Uri.parse("$BASE_URL/models"),
      headers: {'Authorization': 'Bearer $API_KEY'},
    );

    final jsonResponse = jsonDecode(response.body);

    List temp = [];
    for (var value in jsonResponse['data']) {
      temp.add(value);
      print("temp${value["id"]}");
    }

    return ChatModel.modelsFromSnapshot(temp);
  }
//send ,sf function 
static Future<void> sendMessage
({required String message , required String modelId}) async {
    var response = await http.post(
      Uri.parse("$BASE_URL/completions"),
      headers: {'Authorization': 'Bearer $API_KEY',
      'Content-Type': 'application/json'
      },
      body:jsonEncode(

     {"model" : modelId ,
      "prompt":message,
      "max_tokens":100
     
     }

      )
    );

    Map jsonResponse = jsonDecode(response.body);

    if(jsonResponse["choices"].length>0){
     log("jsonResponse text ${jsonResponse["choices"][0]["text"]}");
    }
  }

}

 