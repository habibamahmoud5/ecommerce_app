import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/bottom_navigation_barr_screen.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:flutter/material.dart';

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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const BottomNavigationBarrScreen(initialIndex: 4),
                      ),
                    );
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

              const SizedBox(height: 10),

              const Divider(
                color: AppColors.lightGray,
                thickness: 1.2,
                height: 1,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 36,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 6),
                          itemBuilder: (context, index) {
                            final selected = selectedCategory == index;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: selected
                                      ? AppColors.black
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: selected
                                        ? AppColors.black
                                        : AppColors.lightGray,
                                  ),
                                ),
                                child: Text(
                                  categories[index],
                                  style: AppTextStyles.b1Medium.copyWith(
                                    color: selected
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 15),

                      Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.lightGray),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          style: AppTextStyles.b1Regular.copyWith(
                            color: AppColors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search for questions...',
                            hintStyle: AppTextStyles.b1Regular.copyWith(
                              color: AppColors.gray999,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 24,
                              color: AppColors.gray999,
                            ),
                            suffixIcon: const Icon(
                              Icons.mic_none,
                              size: 24,
                              color: AppColors.gray999,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 11,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: questions.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final isOpen = openedQuestion == index;

                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(color: AppColors.lightGray),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                // QUESTION
                                InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    setState(() {
                                      if (openedQuestion == index) {
                                        openedQuestion = -1;
                                      } else {
                                        openedQuestion = index;
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            questions[index]['question']!,
                                            style: AppTextStyles.b1Medium
                                                .copyWith(
                                                  color: AppColors.black,
                                                ),
                                          ),
                                        ),

                                        Icon(
                                          isOpen
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
                                          size: 20,
                                          color: AppColors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // ANSWER
                                if (isOpen)
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      10,
                                      0,
                                      10,
                                      12,
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        questions[index]['answer']!,
                                        style: AppTextStyles.b3Regular.copyWith(
                                          color: AppColors.gray808,
                                          height: 1.4,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
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
