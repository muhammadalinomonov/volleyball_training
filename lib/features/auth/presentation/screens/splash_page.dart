
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:volleyball_training/assets/images.dart';
import 'package:volleyball_training/features/auth/presentation/screens/enter_user_name.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialWithModalsPageRoute(builder: (context) => const EnterNameScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 140),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Image.asset(AppImages.splash),
          ),
          const Text('Volleyball Training', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
