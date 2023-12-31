import 'dart:math';

import 'package:flutter/material.dart';

import '../../../models/activity.model.dart';

class TripActivityCard extends StatefulWidget {
  final Activity activity;
  final Function deleteTripActivity;

  Color getColor() {
    const colors = [Colors.blue, Colors.red];
    return colors[Random().nextInt(2)];
  }

  const TripActivityCard(
      {required Key key,
      required this.activity,
      required this.deleteTripActivity})
      : super(key: key);

  @override
  State<TripActivityCard> createState() => _TripActivityCardState();
}

class _TripActivityCardState extends State<TripActivityCard> {
  late Color color;
  @override
  void initState() {
    color = widget.getColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(widget.activity.image),
      ),
      title: Text(
        widget.activity.name,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(widget.activity.city),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          widget.deleteTripActivity(widget.activity.id);
        },
      ),
    ));
  }
}
