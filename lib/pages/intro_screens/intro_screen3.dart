import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: const Color(0XFFB170DC),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.intro_three_title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 32),
          ),
          const SizedBox(
            height: 50,
          ),
          SvgPicture.asset(
            'assets/images/intro_three.svg',
            width: 180,
            height: 180,
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
