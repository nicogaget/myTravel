import 'package:flutter/material.dart';
import '../../views/city/widgets/activity_list.dart';
import '../../views/city/widgets/trip_activity_List.dart';
import '../../views/city/widgets/trip_overview.dart';
import '../../datas/data.dart' as data;
import '../../models/activity_model.dart';
import '../../models/trip_model.dart';
import '../../models/city_model.dart';

class CityView extends StatefulWidget {
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

  CityView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CityViewState createState() => _CityViewState();
}

class _CityViewState extends State<CityView> with WidgetsBindingObserver {
  late Trip myTrip;
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
    myTrip = Trip(activities: [], city: 'Lyon', date: null);
    WidgetsBinding.instance.addObserver(this);
  }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => myTrip.activities.contains(activity.id))
        .toList();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
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
    final City city = ModalRoute.of(context)!.settings.arguments as City;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
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
              cityName: city.name,
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
