import 'package:flutter/material.dart';

class LoadingDialog {
  static BuildContext _context;

  static Future show(BuildContext context, {String message}) async {
    _context = context;
    showDialog(
      context: _context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            content: ListTile(
              leading: CircularProgressIndicator(),
              title: Text(message ?? 'Carregando...'),
            ),
          ),
        );
      },
    );
  }

  static void hide() async {
    Navigator.of(_context, rootNavigator: true).pop();
  }
}
