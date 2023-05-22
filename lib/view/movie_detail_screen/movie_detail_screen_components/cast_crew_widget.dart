
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../model/movies_model.dart';

class CastCrewWidget extends StatelessWidget {
  const CastCrewWidget({
    super.key,
    required this.movie,
    required this.title,
    
  });

  final Movie movie;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Constants.smallGap,
         Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        Constants.gap,
        SizedBox(
          height: 200,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(movie.cast[index].image),
                    radius: 52,
                  ),
                  Text(
                    movie.cast[index].name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text("as ${movie.cast[index].character}"),
                ],
              );
            },
            itemCount: movie.cast.length,
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
          ),
        ),
      ],
    );
  }
}