import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {},
          tooltip: 'Play',
          backgroundColor: const Color.fromRGBO(46, 125, 50, 1),
          child: const Icon(
            Icons.play_arrow,
            size: 40.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
