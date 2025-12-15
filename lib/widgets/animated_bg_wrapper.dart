import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/background/controllers/bg_controller.dart';
import '../features/background/controllers/bg_wrapper_controller.dart';
import '../generated/assets.gen.dart';

class AnimatedBgWrapper extends StatelessWidget {
  final Widget child;
  final List<AssetGenImage> assets;

  static List<AssetGenImage> get defaultAssets => [
    Assets.images.background.bg1,
    Assets.images.background.bg2,
    Assets.images.background.bg3,
  ];

  AnimatedBgWrapper({
    super.key,
    required this.child,
    List<AssetGenImage>? assets,
  }) : assets = assets ?? defaultAssets;

  @override
  Widget build(BuildContext context) {
    // Get controllers
    final bg = Get.find<BackgroundController>();
    final wrapperController = Get.put(
      BgWrapperController(),
      tag: 'bg_wrapper_$hashCode',
    );

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final rowKey = GlobalKey();

    // Measure row width after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      wrapperController.measureRowWidth(rowKey);
    });

    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          fit: StackFit.expand,
          children: [
            /// Background (never rebuilds UI, only updates transform)
            Positioned.fill(
              child: Obx(() {
                // Use measured width or fallback to estimated width
                final totalWidth = wrapperController.rowWidth.value > 0
                    ? wrapperController.rowWidth.value
                    : screenWidth * assets.length;
                final maxOffset = totalWidth > screenWidth
                    ? totalWidth - screenWidth
                    : 0.0;

                return AnimatedBuilder(
                  animation: bg.animationController,
                  builder: (_, child) {
                    final offset = bg.animation.value * maxOffset;

                    return Transform.translate(
                      offset: Offset(offset, 0),
                      child: child,
                    );
                  },
                  child: OverflowBox(
                    minWidth: 0,
                    maxWidth: double.infinity,
                    minHeight: screenHeight,
                    maxHeight: screenHeight,
                    alignment: Alignment.topLeft,
                    child: Row(
                      key: rowKey,
                      mainAxisSize: MainAxisSize.min,
                      children: assets.map((asset) {
                        return SizedBox(
                          height: screenHeight,
                          child: asset.image(
                            fit: BoxFit.fitHeight,
                            height: screenHeight,
                            alignment: Alignment.center,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              }),
            ),

            /// Foreground page
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: SizedBox.expand(
                  child: ColoredBox(color: Colors.black.withValues(alpha: 0.5)),
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
