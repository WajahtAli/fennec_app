import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/animated_bg_wrapper.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBgWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Page One"),
          backgroundColor: Colors.black.withOpacity(0.3),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => Get.toNamed("/animations"),
            child: const Text("Go to Animations"),
          ),
        ),
      ),
    );
  }
}
