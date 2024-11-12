import 'package:flutter/cupertino.dart';
import 'package:volleyball_training/assets/colors.dart';
import 'package:volleyball_training/assets/images.dart';
import 'package:volleyball_training/core/singeltons/utils/string_extensions.dart';
import 'package:volleyball_training/features/common/presentation/widgets/w_button.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              const Color(0xFF9747FF),
              const Color(0xFF6F00FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Image.asset(
              AppImages.boyPlayer,
              width: 148,
              height: 148,
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Bizning dastur orqali siz yangi yutuqlarga erishing',
                          style: context.textTheme.headlineSmall!
                              .copyWith(fontSize: 24, fontWeight: FontWeight.bold, color: white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  WButton(
                    width: 144,
                    onTap: () {},
                    color: white,
                    text: 'Davom etish',
                    textStyle: context.textTheme.headlineSmall!.copyWith(
                      fontSize: 16,
                      color: mainColor,
                    ),
                  )
                ],
              ),
            ),
            // Positioned(
            //     child: Image.asset(
            //       AppImages.boyPlayer,
            //       width: 148,
            //       height: 148,
            //     ),
            //     right: 0,
            //     bottom: 0),
          ],
        ));
  }
}
