import 'package:flutter/cupertino.dart';

class CustomCupertinoConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final Color? confirmButtonColor;
  final Icon? icon;
  final Widget? child;

  const CustomCupertinoConfirmationDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.onConfirm,
    required this.onCancel,
    this.confirmButtonColor,
    this.icon,
    this.child,
  }) : super(key: key);

  void showDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Column(
            children: [
              icon ?? Container(),
              Text(title),
            ],
          ),
          content: child ?? Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: onCancel,
              child: Text(cancelButtonText),
            ),
            CupertinoDialogAction(
              onPressed: onConfirm,
              child: Text(confirmButtonText,
                  style: TextStyle(
                    color: confirmButtonColor ?? CupertinoColors.activeBlue,
                  )),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: onCancel,
          child: Text(cancelButtonText),
        ),
        CupertinoDialogAction(
          onPressed: onConfirm,
          child: Text(confirmButtonText),
        ),
      ],
    );
  }
}
