import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_travel/views/city/widgets/activity_list.dart';
import 'package:my_travel/views/city/widgets/trip_activity_List.dart';
import 'package:my_travel/views/city/widgets/trip_overview.dart';
import '../../datas/data.dart' as data;
import '../../models/activity.model.dart';
import '../../models/trip.model.dart';

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;

  City({super.key}) {
    print('constructor widget');
  }

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  late Trip trip;
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
    trip = Trip(activities: [], city: 'Lyon', date: null);
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
          trip.date = newDate;
        });
      }
    });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
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
        child: Column(
          children: <Widget>[
            TripOverview(
              setDate: setDate,
              trip: trip,
            ),
            Expanded(
                child: index == 0
                    ? ActivityList(activities: widget.activities)
                    : const TripActivityList()),
          ],
        ),

        /*child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: widget.activities
              .map((activity) => ActivityCard(activity: activity))
              .toList(),
        ),*/
        /*child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return ActivityCard(activity: widget.activities[index]);
          },
          itemCount: widget.activities.length,
        ),*/
        /*child: ListView.separated(
          itemBuilder: (context, index) {
            return ActivityCard(activity: widget.activities[index]);
          },
          itemCount: widget.activities.length,
          separatorBuilder: (context, index) {
            //return Divider();
            return SizedBox(
              height: 5,
            );
          },
        ),*/
        /*child: ListView.builder(
          itemBuilder: (context, index) {
            return ActivityCard(activity: widget.activities[index]);
          },
          itemCount: widget.activities.length,
        ),*/
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
