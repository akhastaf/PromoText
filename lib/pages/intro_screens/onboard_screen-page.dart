import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:promo_app/pages/store/main_page_store.dart';
import 'package:promo_app/pages/intro_screens/intro_screen1.dart';
import 'package:promo_app/pages/intro_screens/intro_screen2.dart';
import 'package:promo_app/pages/intro_screens/intro_screen3.dart';
import 'package:promo_app/services/storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen>
    with AfterLayoutMixin<OnboardScreen> {
  final PageController _controler = PageController();
  StorageSecure storageSecure = Get.find<StorageSecure>();
  bool onLastPage = false;
  bool introShow = false;

  Future<void> checkFirstSeen() async {
    await storageSecure.storage.write(key: 'intro', value: 'true');
  }

  @override
  void afterFirstLayout(BuildContext context) {
    checkFirstSeen();
  }

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
            children: const [
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
                    // storageSecure.storage.delete(key: 'intro');
                    _controler.jumpToPage(2);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.skip,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
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
                          Get.offAllNamed('/');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                            color: Colors.black,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.done,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controler.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            shape: BoxShape.rectangle,
                            color: Colors.black,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.next,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
