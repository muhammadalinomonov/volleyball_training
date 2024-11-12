import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:mahallam/assets/colors/colors.dart';
// import 'package:mahallam/assets/constants/icons.dart';
// import 'package:mahallam/core/utils/string_extensions.dart';
import 'package:volleyball_training/assets/colors.dart';
import 'package:volleyball_training/core/singeltons/utils/string_extensions.dart';

// import 'stroke_paint.dart';

class WTextField extends StatefulWidget {
  final bool? hasSearch;
  final bool? hasBorderColor;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? validate;
  final bool? hasClearButton;
  final String title;
  final Color? disabledBorderColor;
  final double borderRadius;
  final TextStyle? titleTextStyle;
  final TextStyle? textStyle;
  final TextStyle? counterStyle;
  final String? hintText;
  final TextStyle? prefixStyle;
  final TextStyle? hintTextStyle;
  final String prefixText;
  final bool? hideCounterText;
  final Widget? prefix;
  final EdgeInsets? prefixPadding;
  final double? width;
  final double? height;
  final int? maxLength;
  final TextInputType? keyBoardType;
  final bool? isObscure;
  final Widget? suffix;
  final String? suffixIcon;
  final EdgeInsets? suffixPadding;
  final TextCapitalization textCapitalization;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter>? textInputFormatters;
  final EdgeInsets? contentPadding;
  final bool hasError;
  final double sizeBetweenFieldTitle;
  final Color? errorColor;
  final Color fillColor;
  final EdgeInsets? margin;
  final VoidCallback? onEyeTap;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final Function? onObscure;
  final Function? onTapSuffix;
  final Function()? onEditCompleted;
  final Function()? onTap;
  final bool autoFocus;
  final Color? disabledColor;
  final double? suffixRightPosition;
  final double? suffixSize;
  final int? maxLines;
  final int? minLines;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final Color? focusColor;
  final BorderRadius? detailedBorderRadius;
  final bool readOnly;
  final Widget? suffixTitleWidget;
  final String hintNextToTitle;
  final TextStyle? hintNextToTitleStyle;
  final Color? cursorColor;
  final bool dynamicHeight;
  final bool enabled;
  final Widget? Function(BuildContext, {required int currentLength, required bool isFocused, required int? maxLength})?
      buildCounter;

  const WTextField({
    this.controller,
    required this.onChanged,
    this.hasBorderColor,
    this.readOnly = false,
    this.disabledColor,
    this.validate,
    this.autoValidateMode,
    this.hideCounterText,
    this.autoFocus = false,
    this.borderRadius = 6,
    this.prefixStyle,
    this.disabledBorderColor,
    this.hasClearButton,
    this.textAlign = TextAlign.start,
    this.width,
    this.fillColor = quartz,
    this.title = '',
    this.titleTextStyle,
    this.textStyle,
    this.hintText,
    this.hintTextStyle,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.prefixText = '',
    this.prefix,
    this.prefixPadding = const EdgeInsets.all(2),
    this.suffix,
    this.suffixIcon,
    this.suffixPadding = const EdgeInsets.all(8),
    this.isObscure,
    this.onEyeTap,
    this.margin,
    this.sizeBetweenFieldTitle = 8,
    this.errorColor,
    this.hasError = false,
    this.textInputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.keyBoardType,
    this.maxLength,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.height,
    this.onObscure,
    this.onTapSuffix,
    super.key,
    this.onEditCompleted,
    this.onTap,
    this.suffixRightPosition,
    this.suffixSize,
    this.maxLines = 1,
    this.minLines,
    this.borderColor,
    this.enabledBorderColor,
    this.detailedBorderRadius,
    this.focusColor,
    this.suffixTitleWidget,
    this.hintNextToTitle = '',
    this.hasSearch,
    this.cursorColor,
    this.hintNextToTitleStyle,
    this.counterStyle,
    this.buildCounter,
    this.dynamicHeight = false,
    this.enabled = true,
  });

  @override
  State<WTextField> createState() => _WTextFieldState();
}

class _WTextFieldState extends State<WTextField> with SingleTickerProviderStateMixin {
  late FocusNode focusNode;
  bool focused = false;
  bool hasText = false;
  bool isObscure = false;
  bool showStroke = false;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    super.initState();
    if (widget.isObscure != null) {
      isObscure = widget.isObscure!;
    }
    focusNode = FocusNode();

    focusNode.addListener(
      () => setState(() {
        focused = !focused;
      }),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      widget.title,
                      style: widget.titleTextStyle ??
                          context.textTheme.headlineLarge!.copyWith(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    Text(
                      ' ${widget.hintNextToTitle}',
                      style: widget.hintNextToTitleStyle ??
                          Theme.of(context).textTheme.labelLarge!.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ],
                ),
                if (widget.suffixTitleWidget != null) widget.suffixTitleWidget!,
              ],
            )
          else
            const SizedBox(),
          SizedBox(
            height: widget.title.isNotEmpty ? widget.sizeBetweenFieldTitle : null,
          ),
          Container(
            height: !widget.dynamicHeight ? (widget.height ?? 40) : null,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: widget.detailedBorderRadius ?? BorderRadius.circular(6),
              color: Colors.transparent,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: widget.detailedBorderRadius ?? BorderRadius.circular(widget.borderRadius),
                  child: TextFormField(
                    enabled: widget.enabled,
                    cursorWidth: 1,
                    buildCounter: widget.buildCounter,
                    cursorRadius: const Radius.circular(1),
                    autovalidateMode: widget.autoValidateMode,
                    validator: widget.validate,
                    maxLines: widget.maxLines,
                    minLines: widget.minLines,
                    onTap: widget.onTap,
                    readOnly: widget.readOnly,
                    textAlign: widget.textAlign,
                    inputFormatters: widget.textInputFormatters,
                    textInputAction: widget.textInputAction,
                    textCapitalization: widget.textCapitalization,
                    obscureText: isObscure,
                    keyboardType: widget.keyBoardType,
                    maxLength: widget.maxLength,
                    controller: widget.controller,
                    autofocus: widget.autoFocus,
                    cursorColor: widget.cursorColor ?? context.theme.primaryColorDark,
                    obscuringCharacter: '●',
                    cursorHeight: 18,
                    onEditingComplete: widget.onEditCompleted,
                    onChanged: (s) {
                      if (s.length == 1 || s.isEmpty) {
                        setState(() => hasText = s.isNotEmpty);
                      }
                      widget.onChanged(s);
                    },
                    focusNode: widget.focusNode ?? focusNode,
                    style: widget.textStyle ??
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: context.theme.primaryColorDark,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                    decoration: InputDecoration(
                      counterText: '',
                      suffix: widget.suffix != null ? SizedBox(width: widget.suffixSize) : null,
                      border: OutlineInputBorder(
                        borderRadius: widget.detailedBorderRadius ?? BorderRadius.circular(widget.borderRadius),
                        borderSide: BorderSide(
                          width: 1,
                          color: widget.hasError
                              ? Theme.of(context).colorScheme.error
                              : widget.enabledBorderColor ?? black,
                        ),
                      ),
                      counterStyle: widget.counterStyle,
                      hintText: widget.hintText,
                      hintStyle: widget.hintTextStyle ??
                          context.textTheme.titleSmall!.copyWith(
                            color: context.theme.hintColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                      filled: true,
                      prefixIcon: widget.hasSearch != null && widget.hasSearch!
                          ? Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                               /*child:SvgPicture.asset(
                                AppIcons.search,
                              ),*/
                            )
                          : widget.prefix,
                      fillColor: focused
                          ? widget.focusColor ?? context.theme.scaffoldBackgroundColor
                          : widget.disabledColor != null
                              ? widget.controller != null && widget.controller!.text.isNotEmpty
                                  ? widget.fillColor ?? white
                                  : widget.disabledColor
                              : widget.fillColor,
                      contentPadding: widget.contentPadding,
                      disabledBorder: OutlineInputBorder(
                        borderRadius: widget.detailedBorderRadius ?? BorderRadius.circular(widget.borderRadius),
                        borderSide: BorderSide(
                          width: 1,
                          color: widget.hasBorderColor != null && !widget.hasBorderColor!
                              ? Colors.red
                              : widget.hasError
                                  ? Theme.of(context).colorScheme.error
                                  : widget.disabledBorderColor ??
                                      widget.borderColor ??
                                      context.theme.secondaryHeaderColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: widget.detailedBorderRadius ?? BorderRadius.circular(widget.borderRadius),
                        borderSide: BorderSide(
                          width: 1,
                          color: widget.hasBorderColor != null && !widget.hasBorderColor!
                              ? Colors.transparent
                              : widget.hasError
                                  ? Theme.of(context).colorScheme.error
                                  : widget.disabledBorderColor ?? widget.enabledBorderColor ?? Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: widget.detailedBorderRadius ?? BorderRadius.circular(widget.borderRadius),
                        borderSide: BorderSide(
                          width: 1,
                          color: widget.hasBorderColor != null && !widget.hasBorderColor!
                              ? Theme.of(context).colorScheme.primary
                              : widget.hasError
                                  ? Theme.of(context).colorScheme.error
                                  : widget.borderColor ?? context.theme.secondaryHeaderColor,
                        ),
                      ),
                    ),
                  ),
                ),
                if (widget.prefixText.isNotEmpty)
                  Positioned(
                    top: 11,
                    left: 12,
                    child: Padding(
                      padding: widget.prefixPadding ?? EdgeInsets.zero,
                      child: Text(
                        widget.prefixText,
                        style: widget.prefixStyle ?? Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15),
                      ),
                    ),
                  )
                else
                  const SizedBox(),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: widget.suffixRightPosition ?? 0,
                  child: widget.hasClearButton != null && widget.hasClearButton!
                      ? widget.controller != null && widget.controller!.text.isNotEmpty
                          ? GestureDetector(
                              onTap: () {
                                setState(() {});
                                widget.controller!.clear();
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                // child: SvgPicture.asset(AppIcons.clear),
                              ),
                            )
                          : const SizedBox()
                      : Padding(
                          padding: widget.suffixPadding ?? const EdgeInsets.all(8.0),
                          child: widget.suffix ?? const SizedBox.shrink(),
                        ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 12,
                  child: widget.isObscure == null
                      ? widget.suffixIcon != null
                          ? GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: widget.suffixPadding!,
                                child: SvgPicture.asset(
                                  widget.suffixIcon!,
                                  colorFilter: ColorFilter.mode(
                                      context.theme.colorScheme.onSecondary.withOpacity(.5), BlendMode.srcIn),
                                ),
                              ),
                            )
                          : const SizedBox.shrink()
                      : GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                            if (showStroke) {
                              showStroke = false;
                              animationController.forward();
                            } else {
                              showStroke = true;
                              animationController.reverse();
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            //margin: const EdgeInsets.only(top: 12),
                            // width: 24,
                            // height: 24,
                            child: Center(
                              child: AnimatedBuilder(
                                animation: animationController,
                                child: SvgPicture.asset(
                                  'AppIcons.eyeOpen',
                                  color: context.theme.canvasColor,
                                ),
                                builder: (context, child) => SizedBox(
                                  width: 24,
                                  height: 24,
                                  // child: CustomPaint(
                                  //   foregroundPainter: StrokePaint(
                                  //     animationController.value,
                                  //     context.theme.canvasColor,
                                  //     focused
                                  //         ? context.theme.scaffoldBackgroundColor
                                  //         : context.theme.unselectedWidgetColor,
                                  //   ),
                                  //   child: child,
                                  // ),
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
