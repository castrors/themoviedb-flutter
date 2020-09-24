import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;
  final Key textKey;

  const ErrorMessageWidget({this.textKey, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(fontSize: 20),
        key: textKey,
      ),
    );
  }
}
