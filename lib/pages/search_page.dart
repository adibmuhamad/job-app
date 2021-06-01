import 'package:flutter/material.dart';
import 'package:job_app/models/job.dart';
import 'package:job_app/providers/job_provider.dart';
import 'package:job_app/theme.dart';
import 'package:job_app/widgets/job_card.dart';
import 'package:job_app/widgets/search.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {

    var jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: edge,
            ),
            Search(
              text: query,
              hintText: 'Search of job name/type/location',
              onChanged: (query) {
                Provider.of<JobProvider>(context, listen: false)
                    .getJobs(query);

                setState(() {
                  this.query = query;
                });
              },
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child:
              FutureBuilder(
                future: jobProvider.getJobs(query),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {

                    List<Job> data = new List<Job>.from(snapshot.data as List);

                    int index = 0;
                    return  Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: JobCard(item),
                        );
                      }).toList(),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

