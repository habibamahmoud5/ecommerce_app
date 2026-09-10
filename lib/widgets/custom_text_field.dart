import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool showValidation;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.showValidation = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;
  bool hasError = false;
  bool isValid = false;

  void checkValidation(String value) {
    final error = widget.validator?.call(value);

    setState(() {
      hasError = error != null;
      isValid = value.isNotEmpty && error == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyles.b1Medium.copyWith(color: AppColors.black),
        ),

        const SizedBox(height: 5),

        TextFormField(
          obscureText: widget.obscureText && !isPasswordVisible,

          onChanged: checkValidation,

          validator: (value) {
            final error = widget.validator?.call(value);

            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() {
                  hasError = error != null;
                  isValid = value != null && value.isNotEmpty && error == null;
                });
              }
            });

            return error;
          },

          decoration: InputDecoration(
            hintText: widget.hintText,

            hintStyle: AppTextStyles.b1Regular.copyWith(
              color: AppColors.gray999,
            ),

            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.gray808,
                    ),
                  )
                : hasError
                ? const Icon(Icons.error_outline, color: AppColors.red)
                : isValid
                ? const Icon(Icons.check_circle_outline, color: AppColors.green)
                : null,

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.lightGray),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.gray808),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.gray808),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.gray808),
            ),
          ),
        ),
      ],
    );
  }
}
