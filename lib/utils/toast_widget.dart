import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {

  static bool _isToastShowing = false;
  static const Duration _duration = Duration(seconds: 3);

  //show toast
  static void showToast({required BuildContext context, required String text, ToastType type = ToastType.success}) async {
    if(!_isToastShowing) {
      _isToastShowing = true;
      FToast fToast = FToast();
      fToast.init(context);

      Color color = Theme.of(context).primaryColor;
      IconData icon = Icons.info_outline_rounded;

      switch(type) {
        case ToastType.success:
          color = Colors.green;
          icon = Icons.check;
          break;
        case ToastType.error:
          color = Colors.redAccent;
          icon = Icons.close;
          break;
        case ToastType.warning:
          color = const Color.fromRGBO(204, 204, 0, 1.0);
          icon = Icons.warning_amber_outlined;
          break;
        default:
          break;
      }

      Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),

            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
      fToast.showToast(
        child: toast,
        toastDuration: _duration,
        gravity: ToastGravity.BOTTOM,
      );
      await Future.delayed(_duration);
      _isToastShowing = false;
    }
  }
}

enum ToastType{
  success,
  error,
  warning
}