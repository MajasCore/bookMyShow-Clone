
import 'package:flutter/material.dart';

import '../../../model/movies_model.dart';

class TrailerCard extends StatelessWidget {
  const TrailerCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                Image.network(
                  movie.thumbnail,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: const Center(
                      child: Text(
                    "In cinemas",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                )
              ],
            )),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              )),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.play_arrow),
                Text("Trailer"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
