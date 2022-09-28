import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final int index;
  const ListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Store A',
              style: TextStyle(fontSize: 20),
            ),
            GestureDetector(
              child: const Icon(Icons.arrow_forward_rounded),
              onTap: () {},
            )
          ],
        ),
        // Flexible(
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: 10,
        //     itemBuilder: (context, index) {
        //       return Center(
        //           child: Container(width: 50, height: 70, child: Text('Test' + index.toString())));
        //     },
        //   ),
        // ),
      ],
    );
  }
}
