import 'package:flutter/material.dart';

class Dialogs{
  static final Dialogs _singleton = Dialogs._internal();
  Dialogs._internal();

  factory Dialogs(){
    return _singleton;
  }

  static Widget questionStartDialogue({required VoidCallback onTab}){
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Hi ....", style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold
          ),),
          Text("Please login before you start!!")
        ],
      ),
      actions: [
        TextButton(onPressed: onTab, child: const Text("Confirm"))
      ],
    );
  }
}