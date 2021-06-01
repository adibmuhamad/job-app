import 'package:flutter/material.dart';
import 'package:job_app/models/job.dart';
import 'package:job_app/pages/detail_page.dart';
import 'package:job_app/theme.dart';

class JobCard extends StatelessWidget {

  final Job job;

  JobCard(this.job);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => DetailPage(job),
        )
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 70,
              height: 70,
              child: Stack(
                children: [
                  job.companyLogo == '' ?
                  Image.asset(
                    'assets/images/no_image.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ) :
                  Image.network(
                    job.companyLogo,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: edge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 220,
                  child: Text(
                    job.title,
                    overflow: TextOverflow.ellipsis,
                    style: blackTextStyle.copyWith(
                        fontSize: 16
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  job.type,
                  style: greyTextStyle.copyWith(
                      fontSize: 14
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: 220,
                  child: Text(
                    job.location,
                    overflow: TextOverflow.ellipsis,
                    style: greyTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
