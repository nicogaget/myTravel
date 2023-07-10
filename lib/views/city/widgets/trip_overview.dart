import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip_model.dart';

class TripOverview extends StatelessWidget {
  final String cityName;
  final VoidCallback setDate;
  final Trip trip;

  double get amount {
    return 0;
  }

  const TripOverview(
      {super.key,
      required this.setDate,
      required this.trip,
      required this.cityName});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      width: orientation == Orientation.landscape
          ? size.width * 0.5
          : double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            cityName,
            style: const TextStyle(
              fontSize: 25,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  // ignore: unnecessary_null_comparison
                  trip.date != null
                      ? DateFormat("d/M/y").format(trip.date!)
                      : ('Choisissez une date'),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: setDate,
                child: const Text('choix date'),
              )
            ],
          ),
          Row(
            children: <Widget>[
              const Expanded(
                child: Text(
                  'Montant / pers.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                '$amount €',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
