import 'package:flutter/material.dart';
import 'package:job_app/pages/home_page.dart';
import 'package:job_app/theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 50,
                  left: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/icon.png'),
                          )
                      ),
                    ),
                    Text(
                      'Find your dream job',
                      style: blackTextStyle.copyWith(
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Image.asset(
                      'assets/images/splash.png',
                      height: 400,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 50,
                  ),
                  child: Container(
                    width: 150,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        );
                      },
                      color: redColor,
                      child: Text(
                        'Explore Now',
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
