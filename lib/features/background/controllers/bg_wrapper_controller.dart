import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BgWrapperController extends GetxController {
  final RxDouble rowWidth = 0.0.obs;

  void updateRowWidth(double width) {
    rowWidth.value = width;
  }

  void measureRowWidth(GlobalKey rowKey) {
    final RenderBox? renderBox =
        rowKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      updateRowWidth(renderBox.size.width);
    }
  }
}
