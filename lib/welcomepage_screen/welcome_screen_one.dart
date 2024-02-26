import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiking_travel/cubits/app_cubit.dart';
import 'package:hiking_travel/textWidget/large_text.dart';
import 'package:hiking_travel/textWidget/small_text.dart';

class WelcomeScreenOne extends StatelessWidget {
  const WelcomeScreenOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "img/t-three.jpg",
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
            const LargeText(text: "Trips", size: 30),
            SmallText(
              text: 'Mountain',
              size: 30,
              color: Colors.black87,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white.withOpacity(0.2),
              width: 300,
              child: SmallText(
                  text:
                      'Mountain hikes gives you and incredible sense of freedom along with endurance test',
                  size: 20,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<AppCubits>(context).getData();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 9),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade700.withOpacity(0.8),
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
