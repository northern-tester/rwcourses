import 'package:flutter/material.dart';
import 'package:rwcourses/repository/course_repository.dart';
import 'package:rwcourses/ui/courses/courses_controller.dart';

import '../../constants.dart';
import '../../model/course.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CoursesController(CourseRepository());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
      future: _controller.fetchCourses(Constants.allFilter),
      builder: (context, snapshot) {
        final courses = snapshot.data;
        if (courses == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Text(courses.toString());
      },
    );
  }
}
