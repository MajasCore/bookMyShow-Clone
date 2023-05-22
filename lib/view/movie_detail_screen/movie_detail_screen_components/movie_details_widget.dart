
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../model/movies_model.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: Colors.grey[200]),
          child: Text(
            movie.screenTag,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Constants.smallGap,
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                color: Colors.grey[200]),
            child: Text(
              movie.language.join(","),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Text(
          "${movie.duration} • ${movie.tags.join(",")} • ${movie.certificate} • ${movie.releaseDate}",
          maxLines: 2,
        ),
        Constants.gap,
        Text(
          movie.description,
          overflow: TextOverflow.visible,
          maxLines: 2,
        ),
        Constants.gap,
        Constants.gap,
      ],
    );
  }
}