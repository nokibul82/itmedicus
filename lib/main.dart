import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:itmedicus/views/screens/home_screen.dart';
import 'package:itmedicus/views/screens/products_screen.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blue),
            displayMedium: TextStyle(
                fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
            bodySmall: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            )),
      ),
      home: ProductsScreen(),
    );
  }
}
