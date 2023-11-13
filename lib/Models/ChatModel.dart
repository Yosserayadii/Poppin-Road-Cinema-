class ChatModel {
  final String id;
  final int created;

  ChatModel({
     required this.created,
    required this.id,
   
  });
  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      ChatModel(created: json["created"], id: json["id"]);
    static List<ChatModel> modelsFromSnapshot(List modelSnapshot){
  return modelSnapshot.map((data) => ChatModel.fromJson(data)).toList();
}

}
