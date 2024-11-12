import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:volleyball_training/assets/images.dart';
import 'package:volleyball_training/core/singeltons/utils/string_extensions.dart';
import 'package:volleyball_training/features/auth/presentation/screens/select_gender_screen.dart';
import 'package:volleyball_training/features/common/presentation/widgets/w_button.dart';
import 'package:volleyball_training/features/common/presentation/widgets/w_textfield.dart';
import 'package:volleyball_training/features/navigation/presentation/home.dart';

class EnterUserDataScreen extends StatefulWidget {
  const EnterUserDataScreen({super.key});

  @override
  State<EnterUserDataScreen> createState() => _EnterUserDataScreenState();
}

class _EnterUserDataScreenState extends State<EnterUserDataScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        bottomNavigationBar: WButton(
          height: 46,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          text: 'Davom etish',
          margin: EdgeInsets.only(
              bottom: MediaQuery.paddingOf(context).bottom + MediaQuery.viewInsetsOf(context).bottom, left: 16, right: 16),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 140),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 114),
                child: Image.asset(AppImages.splash),
              ),
              Text('Yoshingiz',
                  style:context.textTheme.headlineLarge!.copyWith(
                    fontSize: 16
                  )),
              WTextField(
                keyBoardType: TextInputType.number,
                onChanged: (value) {},
                hintText: 'Yoshingizni kiriting',
                height: 54,
                borderRadius: 16,
              ),
              SizedBox(height: 16),
              Text('Bo\'yingiz',
                  style:context.textTheme.headlineLarge!.copyWith(
                    fontSize: 16
                  )),
              WTextField(
                keyBoardType: TextInputType.number,
                onChanged: (value) {},
                hintText: 'Bo\'yingizni kiriting(sm)',
                height: 54,
                borderRadius: 16,
              ),
              SizedBox(height: 16),

              Text('Vazningiz',
                  style:context.textTheme.headlineLarge!.copyWith(
                    fontSize: 16
                  )),
              WTextField(
                keyBoardType: TextInputType.number,
                onChanged: (value) {},
                hintText: 'Vazningni kiriting(kg)',
                height: 54,
                borderRadius: 16,
              ),
              SizedBox(height: 16),



              // Spacer(),

            ]),
          ),
        ),
      ),
    );
  }
}
