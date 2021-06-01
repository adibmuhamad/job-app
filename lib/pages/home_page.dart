import 'package:flutter/material.dart';
import 'package:job_app/models/job.dart';
import 'package:job_app/pages/about_page.dart';
import 'package:job_app/pages/search_page.dart';
import 'package:job_app/providers/job_provider.dart';
import 'package:job_app/theme.dart';
import 'package:job_app/widgets/job_card.dart';
import 'package:job_app/widgets/recommendation_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: edge
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search for jobs',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => AboutPage(),
                      ));
                    },
                    child:  Image.asset(
                      'assets/images/info.png',
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Recommended for you',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  FutureBuilder(
                    future: jobProvider.getRecommendationJob(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {

                        List<Job> data = new List<Job>.from(snapshot.data as List);

                        return Row(
                          children: data.map((item) {
                            return Container(
                              child: RecommendationCard(item),
                            );
                          }).toList(),
                        );
                      }

                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Recently added',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
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
                future: jobProvider.getRecentJobs(),
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
              height: 60,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 40,
        width: 100,
        margin: EdgeInsets.symmetric(
            horizontal: edge
        ),
        decoration: BoxDecoration(
          color: redColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => SearchPage(),
              )
              );
            },
            child: Text(
              'Find More',
              style: whiteLightTextStyle.copyWith(
                  fontSize: 12
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
