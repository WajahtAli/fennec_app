import 'package:auto_route/auto_route.dart';
import 'package:fennac_app/routes/routes_imports.gr.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:fennac_app/generated/assets.gen.dart';
import 'package:fennac_app/widgets/movable_background.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _startFlow();
  }

  Future<void> _startFlow() async {
    await _fadeController.forward();
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    context.router.replace(const OnBoardingRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovableBackground(
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Hero(
              tag: 'splash_logo',
              flightShuttleBuilder: _heroFlightBuilder,
              child: Lottie.asset(
                Assets.animations.fennecLogoAnimation,
                repeat: false,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _heroFlightBuilder(
    BuildContext context,
    Animation<double> animation,
    HeroFlightDirection direction,
    BuildContext fromContext,
    BuildContext toContext,
  ) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeOutExpo),
      child: toContext.widget,
    );
  }
}
