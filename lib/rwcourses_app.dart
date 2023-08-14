import 'package:flutter/material.dart';
import 'package:rwcourses/ui/filter/filter_page.dart';
import 'strings.dart';
import 'ui/courses/courses_page.dart';

class RWCoursesApp extends StatelessWidget {
  const RWCoursesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
        actions: <Widget>[
          IconButton(
              onPressed: () => Navigator.of(context).push<MaterialPageRoute>(
                  MaterialPageRoute(builder: (_) => const FilterPage())),
              icon: const Icon(Icons.filter_list))
        ],
      ),
      body: const CoursesPage(),
    );
  }
}
