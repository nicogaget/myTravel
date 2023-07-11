import 'package:flutter/material.dart';
//import 'package:my_travel/views/city/city_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../views/city/city_view.dart';
import '../../views/home/home_view.dart';

import '../../models/city_model.dart';

void main() {
  runApp(const MyTravel());
}

class MyTravel extends StatelessWidget {
  const MyTravel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('fr', 'FR'),
        Locale('en', 'US'), // American English
        // ...
      ],
      debugShowCheckedModeBanner: false,
      //home: HomeView(),
      //initialRoute: '/city',
      routes: {
        '/': (context) => const HomeView(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/city') {
          final City city = settings.arguments as City;
          return MaterialPageRoute(builder: (context) {
            return CityView(city: city);
          });
        }
        return null;
      },
    );
  }
}
