import 'package:flutter/material.dart';
import 'package:my_travel/views/city/city.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_travel/views/home/home_view.dart';

void main() {
  runApp(const MyTravel());
}

class MyTravel extends StatelessWidget {
  const MyTravel({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        Locale('fr', 'FR'),
        Locale('en', 'US'), // American English
        // Israeli Hebrew
        // ...
      ],
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      //home: City(),
    );
  }
}
