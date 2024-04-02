import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static showMessage(msg) {
    return Fluttertoast.showToast(
        msg: msg,
        fontSize: 18,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey[200],
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.black,
        webPosition: 1);
  }

  static void showSnackBar(BuildContext context, String s) {}
}
