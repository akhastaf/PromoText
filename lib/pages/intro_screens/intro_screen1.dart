import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: const Color(0XFFF95278),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Manage your promotions easy',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 32),
          ),
          const SizedBox(
            height: 50,
          ),
          SvgPicture.asset(
            'assets/images/intro_one.svg',
            width: 180,
            height: 180,
          ),
          // Image.asset('assets/images/intro_one.png'),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
