import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:promo_app/components/promotions_list.dart';

import 'customers_list.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              controller: _tabController,
              isScrollable: true,
              labelPadding: const EdgeInsets.only(right: 20, left: 0, bottom: 10),
              indicator: CircleTabIndicator(color: Colors.black, radius: 4),
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Text('Promotions'),
                Text('Customers'),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.maxFinite,
          height: 350,
          child: TabBarView(
            controller: _tabController,
            children: [
              PromotionsList(),
              CustomersList(),
            ],
          ),
        )
      ],
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(
      color: color,
      radius: radius,
    );
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
