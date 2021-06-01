import 'package:flutter/material.dart';
import 'package:job_app/models/job.dart';
import 'package:job_app/pages/detail_page.dart';
import 'package:job_app/theme.dart';

class RecommendationCard extends StatelessWidget {

  final Job job;

  RecommendationCard(this.job);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => DetailPage(job),
        )
        );
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: lightGreyColor,
                    child: Column(
                      children: [
                        job.companyLogo == '' ?
                        Image.asset(
                          'assets/images/no_image.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ) :
                        Image.network(
                          job.companyLogo,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: softGreyColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4,),
                    child: Text(
                      job.type,
                      style: blackTextStyle.copyWith(
                        fontSize: 14
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 180,
              child: Text(
                job.title,
                overflow: TextOverflow.ellipsis,
                style: blackTextStyle.copyWith(
                    fontSize: 14
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
