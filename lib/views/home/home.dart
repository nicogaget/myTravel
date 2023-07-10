import 'package:flutter/material.dart';
import 'package:my_travel/views/home/widgets/city.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List cities = [
    {'name': 'Lyon', 'image': 'assets/images/lyon.jpg', 'checked': false},
    {'name': 'Paris', 'image': 'assets/images/paris.jpg', 'checked': false},
    {'name': 'Nice', 'image': 'assets/images/nice.jpg', 'checked': false},
  ];

  void switchChecked(city) {
    int index = cities.indexOf(city);
    setState(() {
      cities[index]['checked'] = !cities[index]['checked'];
    });
  }

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
              return CityCard(
                name: city['name'],
                image: city['image'],
                checked: city['checked'],
                updateChecked: () {
                  switchChecked(city);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
