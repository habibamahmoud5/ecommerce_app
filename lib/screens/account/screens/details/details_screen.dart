import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/account/screens/details/widget/details_gender_field.dart';
import 'package:ecommerce_app/screens/account/screens/details/widget/details_phone_field.dart';
import 'package:ecommerce_app/screens/account/screens/details/widget/details_text_field.dart';
import 'package:ecommerce_app/screens/bottom_navigation_barr_screen.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:ecommerce_app/widgets/app_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({super.key});

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  final TextEditingController fullNameController = TextEditingController(
    text: 'Cody Fisher',
  );

  final TextEditingController emailController = TextEditingController(
    text: 'cody.fisher45@example',
  );

  final TextEditingController dateController = TextEditingController(
    text: '12/07/1990',
  );

  final TextEditingController phoneController = TextEditingController(
    text: '+1 234 453 231 506',
  );

  String selectedGender = 'Male';

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    dateController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1990, 7, 12),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text =
            '${pickedDate.day.toString().padLeft(2, '0')}/'
            '${pickedDate.month.toString().padLeft(2, '0')}/'
            '${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 25.h, bottom: 25.h),
            child: Column(
              children: [
                AppBarText(
                  title: 'My Details',
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 24.sp,
                      color: AppColors.black,
                    ),
                  ),
                  action: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      size: 24.sp,
                      color: AppColors.black,
                    ),
                  ),
                ),

                10.verticalSpace,

                Divider(
                  color: AppColors.lightGray,
                  thickness: 1.2.h,
                  height: 1.h,
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 18.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailsTextField(
                          label: 'Full Name',
                          controller: fullNameController,
                        ),

                        16.verticalSpace,

                        DetailsTextField(
                          label: 'Email Address',
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        16.verticalSpace,

                        DetailsTextField(
                          label: 'Date of Birth',
                          controller: dateController,
                          readOnly: true,
                          suffixIcon: Icons.calendar_month_outlined,
                          onTap: selectDate,
                        ),

                        16.verticalSpace,

                        DetailsGenderField(
                          selectedGender: selectedGender,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedGender = value;
                              });
                            }
                          },
                        ),

                        16.verticalSpace,

                        DetailsPhoneField(controller: phoneController),

                        80.verticalSpace,
                        AppButtom(
                          text: 'Submit',
                          backgroundColor: AppColors.black,
                          foregroundColor: AppColors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
