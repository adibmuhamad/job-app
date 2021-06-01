
import 'package:flutter/material.dart';
import 'package:job_app/pages/error_page.dart';
import 'package:job_app/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomButton extends StatelessWidget {

  final String title;
  final String url;

  BottomButton({this.title = '', this.url = ''});

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

    return InkWell(
      onTap: (){
        launchUrl(url);
      },
      child: Column(
        children: [
          Spacer(),
          Text(
            title,
            style: whiteLightTextStyle.copyWith(
                fontSize: 12
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
