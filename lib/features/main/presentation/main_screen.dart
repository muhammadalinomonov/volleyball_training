import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volleyball_training/assets/icons.dart';
import 'package:volleyball_training/assets/images.dart';
import 'package:volleyball_training/features/main/presentation/widgets/main_banner.dart';
import 'package:volleyball_training/features/main/presentation/widgets/progress_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Vollayball Training'),
        actions: [
          IconButton(
            iconSize: 24,
            icon: Image.asset(AppImages.splash),
            onPressed: () {
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              MainBanner(),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: WorkoutWidget()),
                  SizedBox(width: 16),
                  Expanded(child: WorkoutWidget()),
                ],
              ),
              SizedBox(height: 24),

            ],
          ),
        ),
      ),
    );
  }
}
