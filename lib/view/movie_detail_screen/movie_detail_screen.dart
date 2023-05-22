
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../model/movies_model.dart';
import 'movie_detail_screen_components/cast_crew_widget.dart';
import 'movie_detail_screen_components/custom_bottom_nav_widget.dart';
import 'movie_detail_screen_components/movie_details_widget.dart';
import 'movie_detail_screen_components/rating_widget.dart';
import 'movie_detail_screen_components/trailer_card_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        title: Text(
          movie.name,
          style: const TextStyle(color: Colors.black),
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar:  CustomBottomNav(movie: movie,),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                TrailerCard(movie: movie),
                Constants.gap,
                RatingSection(movie: movie),
                Constants.gap,
                const RatingButton(),
                Constants.gap,
                MovieDetailsWidget(movie: movie),
                CastCrewWidget(movie: movie, title: "Cast",),
                CastCrewWidget(movie: movie, title: "Crew",),
              ]),
        ),
      )),
    );
  }
}

