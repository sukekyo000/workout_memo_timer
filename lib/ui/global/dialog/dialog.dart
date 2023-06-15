
import 'package:flutter/material.dart';

class GlobalDialog {
  Future<void> showAlertDialogBeforeDelete(BuildContext context, String content, void Function() deleteAction) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(content),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('キャンセル'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            onPressed: deleteAction,
            child: const Text('削除', style: TextStyle(color: Colors.red),),
          ),
        ],
      ),
    );
  }

  Future<void> showAlertDialogBeforeUpdate(BuildContext context, String content, void Function() updateAction) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(content),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('キャンセル'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            onPressed: updateAction,
            child: const Text('更新', style: TextStyle(color: Colors.red),),
          ),
        ],
      ),
    );
  }
}