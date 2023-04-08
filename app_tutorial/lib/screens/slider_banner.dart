import 'dart:async';

import 'package:flutter/material.dart';

class SliderBanner extends StatefulWidget {
  const SliderBanner({Key? key}) : super(key: key);

  @override
  State<SliderBanner> createState() => _SliderBannerState();
}

class _SliderBannerState extends State<SliderBanner> {
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
          ),
        ),
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
          ),
        ),
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
          ),
        ),
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
          ),
        ),
      ),
    )
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController();
    // Otomatik kaydırma işlemi için Timer kullanılır
    Timer.periodic(const Duration(seconds: 2), (timer) {
      _scrollController.animateTo(
        _scrollController.offset + 200,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 200,
        controller: _scrollController,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (BuildContext context, int index) {
            return items[index % items.length];
          },
          childCount: items.length * 3,
          // İçeriği sonsuz gibi görüntülemek için üç katına çıkarın
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
