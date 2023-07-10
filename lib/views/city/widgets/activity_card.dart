import 'package:flutter/material.dart';

import '../../../models/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool isSelected;
  final VoidCallback toggleActivity;

  const ActivityCard(
      {super.key,
      required this.activity,
      required this.isSelected,
      required this.toggleActivity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        //margin: const EdgeInsets.all(1),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Ink.image(
              image: AssetImage(activity.image),
              fit: BoxFit.cover,
              child: InkWell(
                onTap: toggleActivity,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        if (isSelected)
                          const Icon(
                            Icons.check,
                            size: 40,
                            color: Colors.white,
                          ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: FittedBox(
                          child: Text(
                            activity.name,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
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
