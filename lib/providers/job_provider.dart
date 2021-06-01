import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_app/models/job.dart';

class JobProvider extends ChangeNotifier {
  getAllJobs() async {
    var url = Uri.parse('https://jobs.github.com/positions.json?page=1');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Job> jobs = data.map((item) => Job.fromJson(item)).toList();

      return jobs;
    } else {
      return <Job>[];
    }
  }

  getJobs(String query) async {
    var url;
    if (query != '') {
      url = Uri.parse('https://jobs.github.com/positions.json?search=' + query);
    } else {
      url = Uri.parse('https://jobs.github.com/positions.json?page=1');
    }
    var result = await http.get(url);

    print('test');

    print(result.body);
    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Job> jobs = data.map((item) => Job.fromJson(item)).toList();

      return jobs;
    } else {
      return <Job>[];
    }
  }

  getRecommendationJob() async {
    var url = Uri.parse('https://jobs.github.com/positions.json?page=1');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Job> jobs = data.map((item) => Job.fromJson(item)).toList();

      var recommendedList = [];
      final _random = new Random();

      recommendedList = new List.generate(5, (_) => jobs[_random.nextInt(jobs.length)]);
      return recommendedList;
    } else {
      return <Job>[];
    }
  }

  getRecentJobs() async {
    var url = Uri.parse('https://jobs.github.com/positions.json?page=1');
    var result = await http.get(url);


    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Job> jobs = data.map((item) => Job.fromJson(item)).toList();

      // Take 10 recent jobs
      jobs = jobs.take(10).toList();

      return jobs;
    } else {
      return <Job>[];
    }
  }
}