import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:volleyball_training/assets/images.dart';
import 'package:volleyball_training/core/singeltons/utils/string_extensions.dart';
import 'package:volleyball_training/features/auth/presentation/screens/enter_user_data_screen.dart';
import 'package:volleyball_training/features/common/presentation/widgets/w_button.dart';
import 'package:volleyball_training/features/common/presentation/widgets/w_scale_animation.dart';

class SelectGenderScreen extends StatefulWidget {
  const SelectGenderScreen({super.key});

  @override
  State<SelectGenderScreen> createState() => _SelectGenderScreenState();
}

class _SelectGenderScreenState extends State<SelectGenderScreen> {
  String gender = '';
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: 140),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 114),
              child: Image.asset(AppImages.splash),
            ),
            Text('Jinsingiz',
                style: context.textTheme.headlineLarge!.copyWith(
                  fontSize: 24,
                )),
            Row(
              children: [
                Expanded(
                  child: WScaleAnimation(
                    onTap: (){
                      setState(() {
                        gender = 'male';
                      });

                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(AppImages.maleAvatar),
                        ),
                        if(gender == 'male')Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: WScaleAnimation(
                    onTap: (){
                      setState(() {
                        gender = 'female';
                      });

                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(AppImages.feMaleAvatar),
                        ),
                        if(gender == 'female')Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            WButton(

              height: 46,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const EnterUserDataScreen()));
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
