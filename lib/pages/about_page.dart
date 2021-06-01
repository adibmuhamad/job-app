import 'package:flutter/material.dart';
import 'package:job_app/pages/error_page.dart';
import 'package:job_app/utils/underedlist_util.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ErrorPage(),
        ));
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: edge,
                      vertical: 30
                  ),
                  child:  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                            'assets/images/btn_back.png',
                            width: 40
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20)
                        ),
                        color: whiteColor
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: edge,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Credit',
                            style: blackTextStyle.copyWith(
                                fontSize: 18
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          UnorderedList([
                            "Pixabay",
                            "Flaticon",
                          ]),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Inspiration',
                            style: blackTextStyle.copyWith(
                                fontSize: 18
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () {
                              launchUrl('https://dribbble.com/shots/10616495-Job-Portal-App-Concept');
                            },
                            child:  Text(
                              'Tamer Magdy',
                              style: redTextStyle.copyWith(
                                  fontSize: 14
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Source',
                            style: blackTextStyle.copyWith(
                                fontSize: 18
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () {
                              launchUrl('https://jobs.github.com/api');
                            },
                            child:  Text(
                              'Github Job API',
                              style: redTextStyle.copyWith(
                                  fontSize: 14
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
