import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback press;
  const ProfileMenu(
      {super.key, required this.icon, required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextButton(
          onPressed: press,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade100),
              padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)))),
          child: Row(
            children: [
              Icon(
                icon,
                color: Color(0xFF6C63FF),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                text,
                style: const TextStyle(color: Colors.black),
              )),
              const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.black,
              ),
            ],
          )),
    );
  }
}
