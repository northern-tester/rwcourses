import 'package:flutter/material.dart';
import 'package:rwcourses/ui/course_detail/image_container.dart';
import 'package:rwcourses/utils/string_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../model/course.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(course.name)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildBanner(),
            _buildMain(context),
            _buildDetails(context),
            TextButton(
              child: const Text('View Course'),
              onPressed: () => _launchCourse(course.courseId),
            )
          ],
        ));
  }

  Widget _buildBanner() {
    return Hero(
      tag: 'cardArtwork-${course.courseId}',
      child: ImageContainer(
        height: 200,
        url: course.artworkUrl,
      ),
    );
  }

  Widget _buildMain(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                course.name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: 24),
              ),
              Text(
                course.description,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              )
            ]));
  }

  Widget _buildDetails(BuildContext context) {
    const style = TextStyle(fontSize: 16.0);

    return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Domain(s): ${course.domainString}',
              style: style,
            ),
            Text(
              'Level: ${course.difficulty.capitalise()}',
              style: style,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                course.contributors,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }

  void _launchCourse(String courseId) {
    launchUrlString('https://raywenderlich.com/$courseId');
  }
}
