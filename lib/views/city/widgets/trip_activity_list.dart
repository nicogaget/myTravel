// ignore: file_names
import 'package:flutter/material.dart';
import 'package:my_travel/views/city/widgets/trip_activity_card.dart';

import '../../../models/activity.model.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  const TripActivityList(
      {super.key, required this.activities, required this.deleteTripActivity});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: ListView(
        children: activities
            .map((activity) => TripActivityCard(
                  key: ValueKey(activity.id),
                  activity: activity,
                  deleteTripActivity: deleteTripActivity,
                ))
            .toList(),
      ),
    );
  }
}
