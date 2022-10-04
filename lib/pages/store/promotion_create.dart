import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promo_app/components/app_bar.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/components/app_text_filed.dart';
import 'package:promo_app/components/image_stack.dart';
import 'package:get/get.dart';

class PromotionCreate extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  PromotionCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.clear_rounded),
            ),
            Column(
              children: [
                const ImageAvatar(),
                const SizedBox(
                  height: 20,
                ),
                AppTextFiled(
                  controller: titleController,
                  textLabel: 'Tilte',
                  styleLabel: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextFiled(
                  controller: descriptionController,
                  textLabel: 'Description',
                  maxLine: 4,
                  styleLabel: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AppButton(
                    textColor: Colors.white,
                    backgroundColor: Color(0xFF6C63FF),
                    text: 'Create promotions',
                    textSize: 16,
                    width: 170,
                    textWeight: FontWeight.w600,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    raduis: BorderRadius.circular(20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AppButton(
                    textColor: Colors.white,
                    backgroundColor: Colors.grey,
                    text: 'Cancel',
                    textSize: 16,
                    textWeight: FontWeight.w600,
                    width: 120,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    raduis: BorderRadius.circular(20),
                    onPress: () {
                      Get.back();
                    },
                  ),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
