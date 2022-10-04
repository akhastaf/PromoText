import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promo_app/models/manager_model.dart';

class ListItem extends StatelessWidget {
  final Manager store;
  const ListItem({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              store.name ?? '',
              style: TextStyle(fontSize: 20),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_rounded),
              onPressed: () {
                Get.toNamed(
                  '/storeDetails',
                  arguments: store.id
                );
              },
            )
          ],
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: store.promotions?.length ?? 0,
            padding: const EdgeInsets.only(right: 30),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: NetworkImage(store.promotions![index].image),
                      width: 80,
                      height: 80,
                    ),
                    Text(
                      store.promotions![index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black54),
                    ),
                    Text(
                      store.promotions![index].description,
                      style: const TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
