import 'package:app_tutorial/screens/slider_banner.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Slider banner',
            style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w400,
                letterSpacing: 12),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0),
              child: Divider(thickness: 3, color: Colors.deepPurple),
            ),
            SliderBanner(),
          ],
        ),
      ),
    );
  }
}
