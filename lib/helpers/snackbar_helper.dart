import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class SnackbarHelper {
  SnackbarHelper._();

  static void _showMessage({
    BuildContext context,
    String message,
    IconData icon,
    Color color,
  }) {
    Flushbar(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10.0),
      borderRadius: BorderRadius.circular(8.0),
      duration: Duration(seconds: 4),
      message: message,
      icon: Icon(
        icon,
        size: 28.0,
        color: color,
      ),
    ).show(context);
  }

  static void showCreateMessage({BuildContext context, String message}) {
    _showMessage(
      context: context,
      message: message,
      icon: Icons.check,
      color: Colors.green,
    );
  }

  static void showUpdateMessage({BuildContext context, String message}) {
    _showMessage(
      context: context,
      message: message,
      icon: Icons.refresh,
      color: Colors.amber,
    );
  }

  static void showDeleteMessage({BuildContext context, String message}) {
    _showMessage(
      context: context,
      message: message,
      icon: Icons.close,
      color: Colors.red,
    );
  }
}
