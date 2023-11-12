import 'package:flutter/material.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class ModelsDownMenu extends StatefulWidget {
  const ModelsDownMenu({super.key});

  @override
  State<ModelsDownMenu> createState() => _ModelsDownMenuState();
}

class _ModelsDownMenuState extends State<ModelsDownMenu> {
  String currentModel ="Model1";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: CustomColors.getModelsItem,
     
      value: currentModel,
      onChanged: (value){
     currentModel=value.toString();

      },
    );
  }
}