import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promo_app/components/app_button.dart';

class PromotionItemList extends StatelessWidget {
  final int index;
  const PromotionItemList({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Image(
          image: AssetImage('assets/images/test.png'),
          width: 100,
          height: 100,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Lorem ipsum for testing $index',
                style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5,),
            const Text('10-09-2022 at 02:03'),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppButton(
                  textColor: Colors.white,
                  backgroundColor: const Color(0xff458458),
                  text: 'Edit',
                  textSize: 14,
                  textWeight: FontWeight.normal,
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  raduis: BorderRadius.circular(10),
                ),
                const SizedBox(width: 20),
                AppButton(
                  textColor: Colors.white,
                  backgroundColor: Colors.grey.shade400,
                  text: '',
                  textSize: 0,
                  icon: Icons.delete,
                  iconColor: Colors.white,
                  textWeight: FontWeight.normal,
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  raduis: BorderRadius.circular(10),
                ),
                
              ],
            ),

          ],
        )
      ],
    );
  }
}
