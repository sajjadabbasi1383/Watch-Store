import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/component/text_style.dart';

class ErrorSnackBar extends StatelessWidget {
  final String message;

  const ErrorSnackBar({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red.shade100,
          border: Border.all(
            color: Colors.red
          )
        ),
        child: Row(
          children: [
            const Icon(CupertinoIcons.exclamationmark_circle, color: Colors.red,size: 28,),
            Expanded(
                child:
                    Text(message,textAlign: TextAlign.right,textDirection: TextDirection.rtl,style: AppTextStyles.appBarText)),
          ],
        ),
      ),
    );
  }
}

void showTopErrorSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: ErrorSnackBar(message: message),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        behavior: SnackBarBehavior.floating,
      ),
    );
}
