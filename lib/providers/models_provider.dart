import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/ChatModel.dart';
import 'package:poppinroadcimema/services/api_services.dart';

class ModelsProvider with ChangeNotifier {

String currentModel="text-davinci-003"; 
String get getCurrent{ 
  return currentModel;
}
void setCurrentModel(String newModel)
{
  currentModel=newModel;
  notifyListeners(); 
}
List<ChatModel> modelsList = [];

List<ChatModel> get ModelsList{
  return modelsList;
}
Future<List<ChatModel>> getAllModels () async {
  modelsList = (await ApiService.getModels()).cast<ChatModel>();
  return modelsList;  
}
}