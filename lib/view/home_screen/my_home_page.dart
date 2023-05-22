import 'package:book_my_show/constants/constants.dart';
import 'package:book_my_show/controller/movies_list_controller.dart';
import 'package:book_my_show/view/movie_detail_screen/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX<MoviesListController>(
                  init: MoviesListController(),
                  builder: (controller) {
                    return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen(
                                    movie: controller.moviesList[index],
                                  ),
                                ),
                              );
                            },
                            child: UnconstrainedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 300,
                                    width: 200,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        controller.moviesList[index].thumbnail,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 200,
                                    margin: const EdgeInsets.only(top: 4),
                                    padding: const EdgeInsets.only(
                                        left: 6, right: 6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey[300]),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Constants.starColor,
                                        ),
                                        Text(
                                            controller.moviesList[index].rating
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500)),
                                        const Spacer(),
                                        Text(
                                          "${controller.moviesList[index].votes} votes",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 30,
                          );
                        },
                        itemCount: controller.moviesList.length);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
