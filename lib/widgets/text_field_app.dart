
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_test/res/assets/colors.gen.dart';
import 'package:hotel_test/theme/app_typography.dart';

///TODO[1]: change widget
class FieldApp extends StatelessWidget {
  const FieldApp(
      {Key? key,
        this.validator,
        this.initialValue = '',
        this.labelText = '',
        required this.controller,
        this.inputFormater,
      })
      : super(key: key);

  final String? Function(String?)? validator;
  final String initialValue;
  final String labelText;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormater;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: ColorName.greyLight1,
      ),
      child: Center(
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: inputFormater,
          cursorColor: ColorName.black1,
          controller: controller,
          style: AppTypography.proDisplayRegular16
              .copyWith(color: ColorName.black1),
          decoration: InputDecoration(
            errorStyle: TextStyle(height: 0),
            alignLabelWithHint: true,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            label: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Text(
                labelText,
                style: AppTypography.proDisplayRegular17
                    .copyWith(color: ColorName.greyLight3),
              ),
            ),
            //labelText: labelText,
            labelStyle:AppTypography.proDisplayRegular17
                .copyWith(color: ColorName.greyLight3),
            //focusedErrorBorder: InputBorder.none,
            errorBorder: OutlineInputBorder(

              borderSide: BorderSide(color: Color(0xffEB5757),width: 2),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          validator: validator,
        ),
      ),
    );
  }
}