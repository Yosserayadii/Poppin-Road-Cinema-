import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/ChatModel.dart';
import 'package:poppinroadcimema/Screens/chatbot/text_widget.dart';
import 'package:poppinroadcimema/providers/models_provider.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:poppinroadcimema/services/api_services.dart';
import 'package:provider/provider.dart';

class ModelsDownMenu extends StatefulWidget {
  const ModelsDownMenu({super.key});

  @override
  State<ModelsDownMenu> createState() => _ModelsDownMenuState();
}

class _ModelsDownMenuState extends State<ModelsDownMenu> {
  String ? currentModel ;
  @override
  Widget build(BuildContext context) {
    final modelsProvider=Provider.of<ModelsProvider>(context,listen: false);
    currentModel=modelsProvider.getCurrent;
    return FutureBuilder(
        future: modelsProvider.getAllModels(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: TextWidget(label: snapshot.error.toString()),
            );
          } 
          return snapshot.data == null || snapshot.data!.isEmpty
              ? const SizedBox.shrink()
              : FittedBox(
                child: DropdownButton(
                    items: List<DropdownMenuItem<String>>.generate(
                        snapshot.data!.length,
                        (index) => DropdownMenuItem(
                              value: snapshot.data![index].id,
                              child: TextWidget(label: snapshot.data![index].id ),
                            ),
                            ),
                    value: currentModel,
                    onChanged: (value) {
                     setState(() {
                        currentModel = value.toString();
                     });
                     modelsProvider.setCurrentModel(value.toString()); 
                    },
                  ),
              );
        });
  }
}
