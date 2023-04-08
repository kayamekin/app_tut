import 'package:flutter/material.dart';
import 'package:slide_tutorial_app/screens/slider/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = [
    'Men',
    'Women',
    'Devices',
    'Gadgets',
    'Gaming',
    'Eat',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.home_filled,
            color: Colors.deepPurple,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Slide Banner",
          style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.w400,
              letterSpacing: 12),
        ),
        actions: const [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.deepPurple,
          )
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SlidePage(),
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Center(
                                  child: Text(items[index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: 14,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 8.0),
                              child: Card(
                                child: ListTile(
                                  leading: IconButton(
                                    icon: const Icon(Icons.shop,color: Colors.deepPurple,),
                                    onPressed: () {},
                                  ),
                                  title: Text("index $index"),
                                  subtitle: Text("subtitle $index"),
                                ),
                              ),
                            );
                          }))
                ],
              ))
        ],
      ),
    );
  }
}
