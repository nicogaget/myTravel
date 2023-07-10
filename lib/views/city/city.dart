import 'package:flutter/material.dart';
import '../../views/city/widgets/activity_list.dart';
import '../../views/city/widgets/trip_activity_List.dart';
import '../../views/city/widgets/trip_overview.dart';
import '../../datas/data.dart' as data;
import '../../models/activity.model.dart';
import '../../models/trip.model.dart';

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;

  showContext({required BuildContext context, required List<Widget> children}) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else {
      return Column(
        children: children,
      );
    }
  }

  City({super.key});

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  late Trip myTrip;
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
    myTrip = Trip(activities: [], city: 'Lyon', date: null);
  }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => myTrip.activities.contains(activity.id))
        .toList();
  }

  void setDate() {
    showDatePicker(
      context: context,
      locale: const Locale("fr", "FR"),
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          myTrip.date = newDate;
        });
      }
    });
  }

  void toggleActivity(String id) {
    setState(() {
      myTrip.activities.contains(id)
          ? myTrip.activities.remove(id)
          : myTrip.activities.add(id);
    });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void deleteTripActivity(String id) {
    setState(() {
      myTrip.activities.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        title: const Text('Organisation Voyage'),
        actions: const <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        //padding: const EdgeInsets.all(10),
        child: widget.showContext(
          context: context,
          children: <Widget>[
            TripOverview(
              setDate: setDate,
              trip: myTrip,
            ),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: widget.activities,
                      selectedActivities: myTrip.activities,
                      toggleActivity: toggleActivity)
                  : TripActivityList(
                      activities: tripActivities,
                      deleteTripActivity: deleteTripActivity,
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Decouverte'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stars), label: 'Mes activités')
        ],
        onTap: switchIndex,
      ),
    );
  }
}
