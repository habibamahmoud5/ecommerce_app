import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/account/screens/faqs/widget/faq_categories.dart';
import 'package:ecommerce_app/screens/account/screens/faqs/widget/faq_question_item.dart';
import 'package:ecommerce_app/screens/account/screens/faqs/widget/faq_search_field.dart';
import 'package:ecommerce_app/screens/bottom_navigation_barr_screen.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqasScreen extends StatefulWidget {
  const FaqasScreen({super.key});

  @override
  State<FaqasScreen> createState() => _FaqasScreenState();
}

class _FaqasScreenState extends State<FaqasScreen> {
  int selectedCategory = 0;
  int openedQuestion = 0;

  final List<String> categories = ['General', 'Account', 'Service', 'Payment'];

  final List<Map<String, String>> questions = [
    {
      'question': 'How do I make a purchase?',
      'answer':
          'When you find a product you want to purchase, tap on it to view the product details. Check the price, description, and available options (if applicable), and then tap the "Add to Cart" button. Follow the on-screen instructions to complete the purchase, including providing shipping details and payment information.',
    },
    {
      'question': 'What payment methods are accepted?',
      'answer':
          'We accept several payment methods including '
          'credit cards, debit cards, and other available options.',
    },
    {
      'question': 'How do I track my orders?',
      'answer':
          'You can track your order from the My Orders section '
          'and select the order you want to track.',
    },
    {
      'question': 'Can I cancel or return an order?',
      'answer':
          'You can cancel or return your order according to '
          'the available return and cancellation policy.',
    },
    {
      'question': 'How can I contact customer support for assistance?',
      'answer':
          'You can contact our customer service team through '
          'the Customer Service section.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 10),
          child: Column(
            children: [
              AppBarText(
                title: 'FAQs',
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: AppColors.black,
                  ),
                ),
                action: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none,
                    size: 20,
                    color: AppColors.black,
                  ),
                ),
              ),

              10.verticalSpace,

              const Divider(
                color: AppColors.lightGray,
                thickness: 1.2,
                height: 1,
              ),
              5.verticalSpace,

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      FaqCategories(
                        categories: categories,
                        selectedCategory: selectedCategory,
                        onCategorySelected: (index) {
                          setState(() {
                            selectedCategory = index;
                          });
                        },
                      ),
                      15.verticalSpace,
                      FaqSearchField(),
                      15.verticalSpace,
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: questions.length,
                        separatorBuilder: (_, __) => 10.verticalSpace,

                        itemBuilder: (context, index) {
                          final isOpen = openedQuestion == index;

                          return FaqQuestionItem(
                            question: questions[index]['question']!,
                            answer: questions[index]['answer']!,
                            isOpen: isOpen,
                            onTap: () {
                              setState(() {
                                if (openedQuestion == index) {
                                  openedQuestion = -1;
                                } else {
                                  openedQuestion = index;
                                }
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
