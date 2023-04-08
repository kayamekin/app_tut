import 'dart:async';

import 'package:flutter/material.dart';

class SlidePage extends StatefulWidget {
  const SlidePage({super.key});

  @override
  State<SlidePage> createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  late final FixedExtentScrollController _scrollController;

  List<Widget> items = [
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 300,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/slide_1.jpg'),
          fit: BoxFit.cover,
        )),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 300,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/slide_2.jpg'),
          fit: BoxFit.cover,
        )),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 300,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/slide_3.jpg'),
          fit: BoxFit.cover,
        )),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 300,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/slide_4.jpg'),
          fit: BoxFit.cover,
        )),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();

    _scrollController = FixedExtentScrollController();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      _scrollController.animateTo(_scrollController.offset + 200,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListWheelScrollView.useDelegate(
        controller: _scrollController,
        itemExtent: 200,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (BuildContext context, int index) {
            return items[index % items.length];
          },
          childCount: items.length * 30,
        ),
      ),
    );
  }
}
