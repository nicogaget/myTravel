import 'package:flutter/material.dart';

import '../../../models/activity.model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  const ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      //margin: const EdgeInsets.all(1),
      child: Image.asset(
        activity.image,
        fit: BoxFit.cover,
      ),
    );
    /*return Card(
      child: ListTile(
        /* leading: Image.asset(
          activity.image,
          width: 50,
        ),*/
        leading: CircleAvatar(backgroundImage: AssetImage(activity.image)),
        title: Text(activity.name),
        subtitle: Text(activity.city),
        trailing: Checkbox(
          value: false,
          tristate: false,
          onChanged: (value) {},
        ),
      ),
    );*/
  }
}
