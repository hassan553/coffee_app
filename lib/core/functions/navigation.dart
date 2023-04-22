import 'package:flutter/material.dart';
import 'package:get/get.dart';

void navigatedTo(Widget screen) {
  Get.to(screen, transition: Transition.downToUp);
}

void pop(context) {
  Get.back();
}

void navigatedOffAll(Widget screen) {
  Get.offAll(() => screen, transition: Transition.downToUp);
}

void navigatedOff(Widget screen) {
  Get.off(()=>screen, transition: Transition.downToUp);
}
