import 'package:flutter/material.dart';


class PageTile extends StatelessWidget {
  const PageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: const Column(
        children: [
          Text('Classify Transaction'),
        ],
      ),
    );
  }
}