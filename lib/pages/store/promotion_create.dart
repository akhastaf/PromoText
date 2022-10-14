import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promo_app/components/app_bar.dart';
import 'package:promo_app/components/app_button.dart';
import 'package:promo_app/components/app_text_filed.dart';
import 'package:promo_app/components/image_stack.dart';
import 'package:get/get.dart';
import 'package:promo_app/controller/promotions_controller.dart';

class PromotionCreate extends StatefulWidget {
  const PromotionCreate({super.key});

  @override
  State<PromotionCreate> createState() => _PromotionCreateState();
}

class _PromotionCreateState extends State<PromotionCreate> {
  PromotionsController promotionController = Get.put(PromotionsController());
  final _formKey = GlobalKey<FormState>();
  // PromotionCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImageAvatar(),
              const SizedBox(
                height: 20,
              ),
              AppTextFiled(
                controller: promotionController.titleController,
                validation: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Title should not be empty';
                  }
                  return null;
                },
                textLabel: 'Tilte',
                styleLabel: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w400),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFiled(
                controller: promotionController.descriptionController,
                textLabel: 'Description',
                maxLine: 4,
                styleLabel: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w400),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
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
                  onPress: () {
                    promotionController.create(_formKey);
                  },
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
              ])
            ],
          ),
        ),
      ),
    );
  }
}

// class PromotionCreate extends StatelessWidget {
  
  
// }
