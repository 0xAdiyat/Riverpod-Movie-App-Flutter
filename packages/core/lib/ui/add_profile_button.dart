import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddProfileButton extends StatelessWidget {
  const AddProfileButton({Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Icon(Icons.add),
            ),
          ),
          Gap(8.0),
          Text('Add Profile'),
        ],
      ),
    );
  }
}
