import 'dart:convert';
import 'package:rwcourses/model/course.dart';
import 'package:rwcourses/repository/repository.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class CourseRepository implements Repository {
  String dataURL =
      'https://api.raywenderlich.com/api/contents?filter[content_types][]=collection';

  @override
  Future<List<Course>> getCourses(int domainFilter) async {
    final courses = <Course>[];
    var url = dataURL;

    if (domainFilter != Constants.allFilter) {
      url += ';&filter[domain_ids][]=$domainFilter';
    }

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final apiResponse = json.decode(response.body) as Map<String, dynamic>;
    print(apiResponse);

    return courses;
  }
}
