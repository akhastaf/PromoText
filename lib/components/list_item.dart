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
            IconButton(
              icon: const Icon(Icons.arrow_forward_rounded),
              onPressed: () {},
            )
          ],
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            padding: const EdgeInsets.only(right: 30),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Image(
                    image: AssetImage('assets/images/test.png'),
                    width: 75,
                    height: 75,
                  ),
                  Text(
                    'Title $index',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black54
                    ),),
                  Text(
                    'Lorem ipsum for testing $index',
                    style: const TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 12,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
