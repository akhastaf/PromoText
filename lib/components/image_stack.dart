import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ImageAvatar extends StatefulWidget {
  const ImageAvatar({super.key});

  @override
  State<ImageAvatar> createState() => _ImageAvatarState();
}

class _ImageAvatarState extends State<ImageAvatar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey.shade300,
          ),
          InkWell(
            onTap: () {
              showBottomSheet(context: context, builder: ((builder) => BottomModal()));
            },
            child: Icon(Icons.camera_alt_outlined, size: 36, color: Colors.black,),
            // iconSize: 36,
            // color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget BottomModal() {
  return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 8),
      //margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      color: Colors.grey.shade100,
      child: Column(
        children: [
          Text('Choose your image', style: TextStyle(fontSize: 20)),
          const SizedBox(width: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera)
                  ),
                  Text('Camera'),
                ]
              ),
              const SizedBox(width: 20,),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.image),
                  ),
                  Text('Gallery'),
                ]
              )
            ]),
        ]),
    );
  }
}
