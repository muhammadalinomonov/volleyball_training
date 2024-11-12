import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:volleyball_training/assets/images.dart';
import 'package:volleyball_training/core/singeltons/utils/string_extensions.dart';
import 'package:volleyball_training/features/auth/presentation/screens/select_gender_screen.dart';
import 'package:volleyball_training/features/common/presentation/widgets/w_button.dart';
import 'package:volleyball_training/features/common/presentation/widgets/w_textfield.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 140),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 114),
              child: Image.asset(AppImages.splash),
            ),
            Text('Ism',
                style:context.textTheme.headlineLarge!.copyWith(
                  fontSize: 16
                )),
            WTextField(
              onChanged: (value) {},
              hintText: 'Ismingizni kiriting',
              height: 54,
              borderRadius: 16,
            ),
            Spacer(),
            WButton(
              height: 46,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectGenderScreen()));
              },
              text: 'Davom etish',
              margin: EdgeInsets.only(
                  bottom: MediaQuery.paddingOf(context).bottom + MediaQuery.viewInsetsOf(context).bottom),
            )
          ]),
        ),
      ),
    );
  }
}
