import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_assignment/getx_di.dart';
import 'package:internshala_assignment/views/destination_screen.dart';

void main() {
  GetxDependencyInjector().onInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.transparent),
          fontFamily: 'Poppins'
          ),
      home: DestinationScreen(),
    );
  }
}
