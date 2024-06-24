import 'package:firebasework/resources/font_structure.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class AlertDialogBox {
  static sigingOut(BuildContext context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Are you sure ?',
              style: FontStructure.heading1,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                    AuthServices.signingOut(context);
                  },
                  child: Text(
                    'Yes',
                    style: FontStructure.bodyText2,
                  )),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'No',
                    style: FontStructure.bodyText2,
                  )),
            ],
          );
        });
  }
}
