import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../generated/assets.gen.dart';
import '../../../widgets/animated_bg_wrapper.dart';

class AnimationPreviewPage extends StatelessWidget {
  const AnimationPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBgWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lottie Animation Previews'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildAnimationCard(
              context,
              title: 'Fennec Logo Animation',
              assetPath: Assets.animations.fennecLogoAnimation,
            ),
            const SizedBox(height: 24),
            _buildAnimationCard(
              context,
              title: 'Rotating Group Animation',
              assetPath: Assets.animations.rotatingGroupAnimation,
            ),
            const SizedBox(height: 24),
            _buildAnimationCard(
              context,
              title: 'Scrolling Messages',
              assetPath: Assets.animations.scrollingMessages,
            ),
            const SizedBox(height: 24),
            _buildAnimationCard(
              context,
              title: 'Welcome Screen Animation',
              assetPath: Assets.animations.welcomeScreenAnimation,
            ),
            _buildAnimationCard(
              context,
              title: 'Welcome Screen Animation',
              assetPath: Assets.animations.rotatingGroupAnimation1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimationCard(
    BuildContext context, {
    required String title,
    required String assetPath,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Lottie.asset(
            assetPath,
            fit: BoxFit.cover,
            repeat: true,
            animate: true,
            addRepaintBoundary: false,
            frameRate: FrameRate.max,
            options: LottieOptions(enableMergePaths: true),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
