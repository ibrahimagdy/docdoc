import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpTextField extends StatefulWidget {
  final int index;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String value) onChanged;

  const OtpTextField({
    super.key,
    required this.index,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  bool _hasNumber = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_checkForNumber);
    widget.focusNode.addListener(_checkFocus);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_checkForNumber);
    widget.focusNode.removeListener(_checkFocus);
    super.dispose();
  }

  void _checkForNumber() {
    final text = widget.controller.text;
    setState(() {
      _hasNumber = text.isNotEmpty && RegExp(r'\d').hasMatch(text);
    });
  }

  void _checkFocus() {
    setState(() {
      _isFocused = widget.focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.focusNode.requestFocus();
        });
      },
      child: Container(
        width: 70.w,
        height: 80.h,
        decoration: BoxDecoration(
          color: ColorManger.lightestGrey,
          border: Border.all(
            color: (_hasNumber || _isFocused)
                ? ColorManger.mainBlue
                : ColorManger.lighterGrey,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 35.w,
            child: TextFormField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              showCursor: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyles.font18DarkBlueSemiBold.copyWith(
                color: (_hasNumber || _isFocused)
                    ? ColorManger.mainBlue
                    : ColorManger.grey,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1),
              ],
              decoration: InputDecoration(
                isDense: true,
                border: _hasNumber
                    ? InputBorder.none
                    : UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManger.moreLightGrey,
                          width: 1.w,
                        ),
                      ),
                enabledBorder: _hasNumber
                    ? InputBorder.none
                    : UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManger.moreLightGrey,
                          width: 1.w,
                        ),
                      ),
                focusedBorder: _hasNumber
                    ? InputBorder.none
                    : UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManger.moreLightGrey,
                          width: 1.w,
                        ),
                      ),
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: widget.onChanged,
            ),
          ),
        ),
      ),
    );
  }
}
