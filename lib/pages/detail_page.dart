import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiking_travel/cubits/app_cubit.dart';
import 'package:hiking_travel/cubits/app_cubit_state.dart';
import 'package:hiking_travel/textWidget/detail_page_botton.dart';

class DetailPageState extends StatefulWidget {
  const DetailPageState({super.key});

  @override
  State<DetailPageState> createState() => _DetailPageStateState();
}

class _DetailPageStateState extends State<DetailPageState> {
  final int gottenStar = 4;
  int isActive = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitSate>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("http://mark.bslmeiyu.com/uploads/" +
                          detail.place.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon:
                              const Icon(Icons.more_vert, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(2, 5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            color: Colors.indigo.shade600.withOpacity(0.1),
                          ),
                        ]),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              // left: 25,
                              // right: 25,
                              top: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  detail.place.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black.withOpacity(0.9),
                                  ),
                                ),
                                Text(
                                  "\$" + detail.place.price.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.indigo.shade700),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.indigo,
                                size: 18,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                detail.place.location,
                                style: TextStyle(
                                  color: Colors.indigo,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                  5,
                                  (index) {
                                    return Icon(
                                      Icons.star,
                                      color: index < detail.place.stars
                                          ? const Color.fromARGB(
                                              255, 248, 187, 2)
                                          : Colors.grey,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Text(
                                '(5.0)',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "People",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Number of people in your group",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            children: List.generate(
                              5,
                              (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      isActive = index;
                                    });
                                  },
                                  child: DetailPageButton(
                                    color: isActive == index
                                        ? Colors.white
                                        : Colors.black,
                                    size: 50,
                                    backgroundColor: isActive == index
                                        ? Colors.black
                                        : Colors.grey.shade400,
                                    borderColor: isActive == index
                                        ? Colors.black
                                        : Colors.grey.shade400,
                                    text: (index + 1).toString(),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Text(
                            'Description',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            detail.place.description,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  right: 10,
                  child: Row(
                    children: [
                      DetailPageButton(
                        color: Colors.indigo.shade500,
                        size: 50,
                        backgroundColor: Colors.white,
                        borderColor: Colors.indigo.shade500,
                        isIcon: true,
                        icons: Icons.favorite_border,
                      ),
                      Flexible(
                        child: Container(
                          height: 50,
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 9),
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade700,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Back Trip Now',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.double_arrow_rounded,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
