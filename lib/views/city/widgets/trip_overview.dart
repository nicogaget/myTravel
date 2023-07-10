import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip.model.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Trip trip;

  double get amount {
    return 0;
  }

  const TripOverview({super.key, required this.setDate, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Lyon',
            style: TextStyle(
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
