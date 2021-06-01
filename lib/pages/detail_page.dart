import 'package:flutter/material.dart';
import 'package:job_app/models/job.dart';
import 'package:job_app/pages/error_page.dart';
import 'package:job_app/theme.dart';
import 'package:job_app/utils/date_util.dart';
import 'package:job_app/widgets/bottom_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_html/flutter_html.dart';

class DetailPage extends StatefulWidget {

  final Job job;
  DetailPage(this.job);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool isClicked = false;

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
        child: Stack(
          children: [
            Container(
              color: softGreyColor,
              height: 100,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 80
                ),
                child: Center(
                  child: Text(
                    widget.job.company,
                    style: blackTextStyle.copyWith(
                        fontSize: 16
                    ),
                  ),
                ),
              ),
            ),
            ListView(
              children: [
                SizedBox(
                  height: 100,
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
                        horizontal: edge
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Container(
                              width: 50,
                              height: 50,
                              child: Stack(
                                children: [
                                  widget.job.companyLogo == '' ?
                                  Image.asset(
                                    'assets/images/no_image.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ) :
                                  Image.network(
                                    widget.job.companyLogo,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.job.title,
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        Text(
                          widget.job.location,
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: softGreyColor,
                                borderRadius: BorderRadius.circular(23),
                              ),
                              child: Center(
                                child: Text(
                                  widget.job.type,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 12
                                  ),
                                ),
                              ),
                            ),

                            Text(
                              '${DateUtil.formattingDate(widget.job.createdAt)}',
                              style: blackTextStyle.copyWith(
                                  fontSize: 14
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                            height: 30
                        ),

                        Text(
                          'Description',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(
                          height: 5,
                        ),

                        Html(
                          data: widget.job.description,
                        ),

                        SizedBox(
                            height: 30
                        ),

                        Text(
                          'How to apply',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(
                          height: 5,
                        ),

                        Html(
                          data: widget.job.mechanism,
                        ),

                        SizedBox(
                            height: 50
                        ),
                      ],
                    ),
                  ),

                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: edge,
                  vertical: 30
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  InkWell(
                    onTap: (){
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                        isClicked? 'assets/images/btn_wishlist_active.png' : 'assets/images/btn_wishlist.png',
                        width: 40
                    ),
                  ),
                ],
              ),
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
        child: BottomButton(
          title: 'More Info',
          url: '${widget.job.url}',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

