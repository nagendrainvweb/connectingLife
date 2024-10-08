// import 'package:diamon_assorter/util/app_color.dart';
import 'package:clife/util/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked_annotations.dart';

class AppTextfield extends StatelessWidget {
  AppTextfield(
      {Key key,
      this.hint,
      this.icon,
      this.obsecure = false,
      this.color,
      this.textColor = AppColors.blackColor,
      this.controller,
      this.keyboardType = TextInputType.name,
      this.errorText,
      this.onChanged,
      this.enable = true,
      this.maxLength,
      this.showIcon = false,
      this.validator,
      this.suffixIcon,
      this.onIconClicked, this.maxLines})
      : super(key: key);

  final String hint;
  final IconData icon;
  final bool obsecure;
  final Color color;
  final Color textColor;
  final TextEditingController controller;
  final String errorText;
  final Function onChanged;
  final bool showIcon;
  final bool enable;
  final IconData suffixIcon;
  final Function onIconClicked;
  final int maxLength;
  final TextInputType keyboardType;
  final Function validator;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.whiteColor, boxShadow: [
        BoxShadow(color: AppColors.grey200, blurRadius: 5.0, spreadRadius: 3.0),
      ]),
      padding: const EdgeInsets.symmetric(
          //  horizontal: 10,
          vertical: 3),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(
              icon,
              color: AppColors.mainColor,
              size: 20,
            ),
          ),
          Container(
            height: 30,
            width: 1,
            color: AppColors.grey300,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              obscureText: obsecure,
              keyboardType: keyboardType,
              enabled: enable,
              validator: validator,
              maxLines: maxLines,
              inputFormatters: maxLength != null
                  ? [
                      LengthLimitingTextInputFormatter(maxLength),
                    ]
                  : null,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  labelText: hint,
                  fillColor: AppColors.whiteColor,
                  errorText: errorText),
            ),
          ),
        ],
      ),
    );
  }
}
