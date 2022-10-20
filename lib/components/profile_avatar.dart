import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileAvatar extends StatelessWidget {
  final avatar;
  ProfileAvatar({super.key, required this.avatar});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: 115,
            height: 115,
            child: Stack(fit: StackFit.expand, children: [
              CircleAvatar(
                child: Image.network(
                  avatar,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade400,
                      child: Text('no avatar'),
                    );
                  },
                ),
              ),
              Positioned(
                right: -12,
                bottom: 0,
                child: SizedBox(
                  width: 46,
                  height: 46,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt),
                    color: Colors.grey.shade900,
                    onPressed: () {},
                  ),
                ),
              )
            ]),
          );
  }
}