

import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../model/movies_model.dart';

class RatingButton extends StatelessWidget {
  const RatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Colors.blueGrey[50]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "Add your rating & review",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text("Your ratings matter")
            ],
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Constants.starColor,
              side: BorderSide(
                color: Constants.starColor,
                width: 2,
              ),
            ),
            child: const Text('Rate now'),
          )
        ],
      ),
    );
  }
}

class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star_rate_rounded,
          color: Constants.starColor,
        ),
        Text("${movie.rating.ceil().toString()}/10  ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(
          "${movie.votes} votes >",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
