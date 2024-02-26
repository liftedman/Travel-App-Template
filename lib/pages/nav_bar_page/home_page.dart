// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:ui';
// import 'package:hiking_travel/textWidget/large_text.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiking_travel/cubits/app_cubit.dart';
import 'package:hiking_travel/cubits/app_cubit_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "kayaking.png": "Kayaking",
    "snarkling.png": "Snarkling",
    "ballon.png": "Balloning",
    "svg-hiking.png": "Hiking",
  };

  @override
  Widget build(BuildContext context) {
    TabController myController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitSate>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          // BlocProvider.of<AppCubits>(context).goToWelcomePage();
                        },
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage("img/svg-hiking.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Text(
                    'Discover',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Expanded(child: Container()),
                Container(
                  // width: 290,
                  // height: 50,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TabBar(
                      controller: myController,
                      labelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,
                      dividerColor: Colors.white,
                      // dragStartBehavior: DragStartBehavior.start,
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorPadding: const EdgeInsets.only(bottom: -3),
                      indicator: CircleTabBar(
                          color: Colors.indigo.shade700, radius: 4),

                      padding: const EdgeInsets.only(left: 0, right: 0),
                      tabAlignment: TabAlignment.start,
                      tabs: const [
                        Text("Places"),
                        Text("Inspiration"),
                        Text("Emotions"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: double.maxFinite,
                  height: 250,
                  child: TabBarView(
                    controller: myController,
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: info.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context)
                                  .getDetail(info[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/" +
                                          info[index].img),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const Text("Hey there"),
                      const Text("Hello word"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Explore more',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.maxFinite,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(left: 45),
                          // width: double.maxFinite,
                          // height: 100,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'img/${images.keys.elementAt(index)}',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Container(
                                child: Text(
                                  images.values.elementAt(index),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class CircleTabBar extends Decoration {
  final Color color;
  double radius;
  CircleTabBar({
    required this.color,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return BoxPainting(color: color, radius: radius);
  }
}

class BoxPainting extends BoxPainter {
  final Color color;
  double radius;
  BoxPainting({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circlarOffet = Offset(
        configuration.size!.width / 1.6 - radius, configuration.size!.height);
    canvas.drawCircle(
        (offset + circlarOffet),
        //(configuration.size!.width + radius, configuration.size!.height),
        radius,
        paint);
  }
}
