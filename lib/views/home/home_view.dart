import 'package:flutter/material.dart';
import 'widgets/city_card.dart';

import '../../models/city_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  List cities = [
    City(name: 'Lyon', image: 'assets/images/lyon.jpg'),
    City(name: 'Paris', image: 'assets/images/paris.jpg'),
    City(name: 'Nice', image: 'assets/images/nice.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('My Travel'),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map((city) {
              return CityCard(city: city);
            })
          ],
        ),
      ),
    );
  }
}
