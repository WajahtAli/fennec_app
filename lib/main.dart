import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/background/controllers/bg_controller.dart';
import 'routes.dart';
import 'generated/fonts.gen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Create controller once — global background animation stays alive
  Get.put(BackgroundController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fennac App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: FontFamily.sFPro,
        textTheme: const TextTheme().apply(fontFamily: FontFamily.sFPro),
      ),
      initialRoute: "/",
      getPages: routes,
    );
  }
}
