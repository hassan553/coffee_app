import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coffee_app/core/functions/navigation.dart';
import 'package:flutter/cupertino.dart';

showAwesomeDialogs(
    {required BuildContext context, String? title, String? description}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    title: title,
    desc: description,
    btnCancelOnPress: () => pop(context),
    // btnOkOnPress: () {},
  ).show();
}

showErrorAwesomeDialog(
  BuildContext context,
  String? title,
  String? description,
) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    title: title,
    desc: description,
    btnOkOnPress: () {},
  ).show();
}
