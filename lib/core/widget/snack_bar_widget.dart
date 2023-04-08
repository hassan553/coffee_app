import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

showSnackBarWidget(
    {required BuildContext context,
    required String message,
    required RequestStates requestStates}) {
  AnimatedSnackBar.material(
    //requestStates == RequestStates.success ? 'Success' : 'Error',
    message,
    duration: const Duration(milliseconds: 500),
    type:getAnimatedSnackBarType(requestStates),
    // brightness: Brightness.light,
  ).show(
    context,
  );
}

enum RequestStates { success, error, info }

AnimatedSnackBarType getAnimatedSnackBarType(RequestStates requestStates) {
  switch (requestStates) {
    case RequestStates.success:
      return AnimatedSnackBarType.success;
    case RequestStates.error:
      return AnimatedSnackBarType.error;
    case RequestStates.info:
      return AnimatedSnackBarType.info;
  }
}
