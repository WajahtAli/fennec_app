import 'package:get/get.dart';
import 'features/background/pages/page_one.dart';
import 'features/background/pages/animation_preview_page.dart';

final routes = [
  GetPage(name: "/", page: () => const PageOne()),
  GetPage(name: "/animations", page: () => const AnimationPreviewPage()),
];
