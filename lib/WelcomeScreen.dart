import 'dart:ui';

import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        children: [
          OnBoardingScreenItems(
            imagepath: "assets/img1.png",
            color: Color.fromRGBO(255, 175, 78, 1),
            title: "Get Inspired",
            subtitle:
                "Dont't Know what to eat ? Take a\npicture, we will suggest things to \n     cook with your ingrediants",
          ),
          OnBoardingScreenItems(
            imagepath: "assets/img2.png",
            color: Color.fromRGBO(255, 190, 151, 1),
            title: "Easy & Healthy",
            subtitle:
                "Find thousand of easy and\nhealthy recipies so you save\n   time and eat better",
          ),
          OnBoardingScreenItems(
            imagepath: "assets/img3.png",
            color: Color.fromRGBO(31, 176, 144, 1),
            title: "Save your favourites",
            subtitle:
                "Save your favourites recipies and\n  get reminders to buy the  \n ingredients to cook them",
          )
        ],
      ),
      bottomNavigationBar: currentIndex == 2
          ? Container(
              height: size.height / 10,
              width: size.width,
              color: Color.fromRGBO(31, 176, 144, 1),
              alignment: Alignment.center,
              child: Container(
                height: size.height / 15,
                width: size.width / 1.8,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            )
          : Container(
              height: size.height / 14,
              width: size.width,
              color: currentIndex == 0
                  ? Color.fromRGBO(255, 175, 78, 1)
                  : Color.fromRGBO(255, 190, 151, 1),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width / 40,
                  ),
                  TextButton(
                    onPressed: () {
                      _controller.animateToPage(
                        2,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.ease,
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 4.5,
                  ),
                  for (int i = 0; i <= 2; i++)
                    i == currentIndex ? buildCircle(true) : buildCircle(false),
                  SizedBox(
                    width: size.width / 4.5,
                  ),
                  TextButton(
                      onPressed: () {
                        _controller.animateToPage(
                          currentIndex + 1,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.ease,
                        );
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ))
                ],
              ),
            ),
    );
  }

  Widget buildCircle(bool isActive) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        height: isActive ? 12 : 8,
        width: isActive ? 12 : 8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }
}

class OnBoardingScreenItems extends StatelessWidget {
  final String imagepath, title, subtitle;
  final Color color;

  OnBoardingScreenItems(
      {required this.imagepath,
      required this.subtitle,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      color: color,
      child: Column(
        children: [
          SizedBox(
            height: size.height / 10,
          ),
          Container(
            height: size.height / 2,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagepath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
