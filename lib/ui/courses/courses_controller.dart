import 'package:rwcourses/repository/course_repository.dart';
import 'package:rwcourses/repository/repository.dart';

import '../../model/course.dart';

class CoursesController {
  final Repository _repository = CourseRepository();

  Future<List<Course>> fetchCourses(int domainFilter) {
    return _repository.getCourses(domainFilter);
  }
}
