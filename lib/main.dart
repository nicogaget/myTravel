import 'package:flutter/material.dart';
import 'package:my_travel/views/city/city.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_travel/widgets/data.dart';

void main() {
  runApp(const MyTravel());
}

class MyTravel extends StatelessWidget {
  const MyTravel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.red,
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            textTheme:
                const TextTheme(headlineSmall: TextStyle(color: Colors.green))),
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [
          Locale('fr', 'FR'),
          Locale('en', 'US'), // American English
          // Israeli Hebrew
          // ...
        ],
        debugShowCheckedModeBanner: false,
        //home: Home(),
        home: Data(
          child: City(),
        ));
  }
}
