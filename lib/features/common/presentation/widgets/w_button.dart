import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volleyball_training/assets/colors.dart';
import 'package:volleyball_training/features/common/presentation/widgets/w_scale_animation.dart';

class WButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? color;
  final Color textColor;
  final Color? disabledTextColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final BoxBorder? border;
  final double borderRadius;
  final Widget? child;
  final Color? disabledColor;
  final bool isDisabled;
  final bool isLoading;
  final double? scaleValue;
  final List<BoxShadow>? shadow;
  final Gradient? gradient;

  const WButton({
    required this.onTap,
    this.child,
    this.text = '',
    this.color,
    this.textColor = white,
    this.disabledTextColor,
    this.borderRadius = 12,
    this.disabledColor,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.textStyle,
    this.border,
    this.scaleValue,
    this.shadow,
    this.gradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      scaleValue: scaleValue ?? 0.98,
      onTap: () {
        if (!(isLoading || isDisabled)) {
          onTap();
        }
      },
      isDisabled: isDisabled,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: height ?? 46,
        margin: margin,
        padding: padding ?? EdgeInsets.zero,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDisabled ? disabledColor ?? solitude : color ?? mainColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          gradient: isDisabled
              ? null
              : color != null
                  ? null
                  : (gradient),
          boxShadow: shadow,
        ),
        child: isLoading
            ? const Center(
                child: CupertinoActivityIndicator(
                color: Colors.white,
              ))
            : AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      height: 1.36,
                      color: isDisabled ? disabledTextColor ?? greySuitTwo : textColor,
                    ),
                child: child ??
                    Text(
                      text,
                      style: textStyle,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
              ),
      ),
    );
  }
}
