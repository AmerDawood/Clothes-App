import 'package:flutter/material.dart';

mixin Helpers {
  void showSnackBar(
      {required BuildContext context,
      required String message,
      bool error = false
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,style: TextStyle(color: Colors.white),),
        backgroundColor:error?Colors.red:Colors.green,
        behavior: SnackBarBehavior.floating,
      ),

    );
  }
}
