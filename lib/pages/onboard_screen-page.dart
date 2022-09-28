import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promo_app/pages/home_page.dart';
import 'package:promo_app/pages/main_page_store.dart';
import 'package:promo_app/pages/intro_screens/intro_screen1.dart';
import 'package:promo_app/pages/intro_screens/intro_screen2.dart';
import 'package:promo_app/pages/intro_screens/intro_screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController _controler = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controler,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controler.jumpToPage(2);
                  },
                  child: const Text('Skip'),
                ),
                SmoothPageIndicator(
                  controller: _controler,
                  count: 3,
                  effect: SlideEffect(
                      activeDotColor: Colors.grey.shade800,
                      dotWidth: 12.0,
                      dotHeight: 12.0,
                      dotColor: Colors.grey.shade400,
                      spacing: 10.0),
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          // here will be the router to push to the home page
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MainPageStore(),
                            ),
                          );
                        },
                        child: const Text('Done'))
                    : GestureDetector(
                        onTap: () {
                          _controler.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text('Next')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
