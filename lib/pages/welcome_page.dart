import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:hiking_travel/welcomepage_screen/welcome_screen_one.dart';
import 'package:hiking_travel/welcomepage_screen/welcome_screen_three.dart';
import 'package:hiking_travel/welcomepage_screen/welcome_screen_two.dart';
// import 'package:hiking_travel/welcomepage_display/display_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController();
  int isActive = 0;
  List<Widget> pages = [
    const WelcomeScreenOne(),
    const WelcomeScreenTwo(),
    const WelcomeScreenThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: Column(
      //     children: [
      //       Text('Welcome Home'),
      //       Container(
      //         width: 400,
      //         height: 650,
      //         decoration: BoxDecoration(
      //             image: DecorationImage(
      //           fit: BoxFit.cover,
      //           image: AssetImage('img/travel_three.jpg'),
      //         )),
      //       )
      //     ],
      //   ),
      // ),
      // body: PageView.builder(
      //     scrollDirection: Axis.vertical,
      //     itemCount: images.length,
      //     itemBuilder: (_, index) {
      //       return Container(
      //         width: double.maxFinite,
      //         height: double.maxFinite,
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //             fit: BoxFit.cover,
      //             image: AssetImage(
      //               images[index] + 'img/',
      //             ),
      //           ),
      //         ),
      //       );
      //     }),
      body: Stack(
        children: [
          PageView.builder(
              scrollDirection: Axis.vertical,
              onPageChanged: (int page) {
                setState(() {
                  isActive = page;
                });
              },
              controller: pageController,
              itemCount: pages.length,
              itemBuilder: (BuildContext context, index) {
                return pages[index % pages.length];
              }),
          Positioned(
            height: 100,
            bottom: 450,
            left: 9,
            right: 14,
            // top: 15,
            // top: ,
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  pages.length,
                  (index) => buildDots(index, context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDots(int index, BuildContext context) {
    return Container(
      width: isActive == index ? 6 : 6,
      height: isActive == index ? 30 : 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActive == index
            ? Colors.indigo.shade900
            : Colors.grey.withOpacity(
                0.3,
              ),

        // child: SizedBox(
        //   // height: isActive == index ? 30 : 6,
        //   width: isActive == index ? 6 : 30,
        // ),
      ),
    );
  }
}
