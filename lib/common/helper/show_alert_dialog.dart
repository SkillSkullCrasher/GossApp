import 'package:flutter/material.dart';
import 'package:gosapp/common/extension/custom_theme_extension.dart';

showAlertDialog(
    {required BuildContext context, required String message, String? btnText}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('hii'),
          content: Text(
            message,
            style: TextStyle(
              color: context.theme.greyColor,
              fontSize: 15,
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  btnText ?? "OK",
                  style: TextStyle(color: context.theme.CircleImageColor),
                ))
          ],
        );
      });
}
