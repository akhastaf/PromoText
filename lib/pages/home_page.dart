import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 36,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle,
                size: 36,
                color: Colors.grey,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),

                      // borderSide: BorderSide.lerp(a, b, t),
                    ),
                    hintText: 'eg: test',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.qr_code),
                      onPressed: () {},
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
