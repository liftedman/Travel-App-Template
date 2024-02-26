import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiking_travel/textWidget/large_text.dart';
import 'package:hiking_travel/textWidget/small_text.dart';

import '../cubits/app_cubit.dart';

class WelcomeScreenTwo extends StatelessWidget {
  const WelcomeScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "img/t-two.jpg",
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            const LargeText(text: "Wagon Book", size: 30),
            const SmallText(
              text: 'Book Of Interest',
              size: 30,
              color: Colors.black87,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white.withOpacity(0.2),
              width: 300,
              child: const SmallText(
                  text:
                      'Mountain hikes gives you and incredible sense of freedom along with endurance test',
                  size: 20,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<AppCubits>(context).getData();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 9),
                decoration: BoxDecoration(
                  color: Colors.brown.shade800.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.double_arrow_rounded,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
