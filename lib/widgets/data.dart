import 'package:flutter/material.dart';
import '../datas/data.dart' as data;
import '../models/activity.model.dart';

class Data extends InheritedWidget {
  final List<Activity> activities = data.activities;

  Data({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Data>();
  }
}
