import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundController extends GetxController
    with GetTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  AnimationController get animationController {
    if (_animationController == null) {
      throw StateError('AnimationController not initialized');
    }
    return _animationController!;
  }

  Animation<double> get animation {
    if (_animation == null) {
      throw StateError('Animation not initialized');
    }
    return _animation!;
  }

  @override
  void onInit() {
    super.onInit();

    try {
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 10),
      )..repeat(reverse: true);

      // Animation range: 0 to -1
      // 0 = left edge of image at left edge of screen
      // -1 = right edge of image at right edge of screen
      // The actual pixel offset is calculated in the widget based on screen/image dimensions
      _animation = Tween<double>(begin: 0, end: -1).animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.linear),
      );
    } catch (e) {
      // If initialization fails, ensure cleanup
      _disposeAnimationController();
      rethrow;
    }
  }

  @override
  void onClose() {
    _disposeAnimationController();
    super.onClose();
  }

  void _disposeAnimationController() {
    if (_animationController != null) {
      // Stop the animation before disposing to prevent memory leaks
      if (_animationController!.isAnimating) {
        _animationController!.stop();
      }
      _animationController!.dispose();
      _animationController = null;
      _animation = null;
    }
  }

  /// Manually dispose the controller (useful for permanent controllers)
  @override
  void dispose() {
    _disposeAnimationController();
    super.dispose();
  }
}
