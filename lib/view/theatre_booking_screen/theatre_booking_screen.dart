import 'package:book_my_show/constants/constants.dart';
import 'package:book_my_show/model/movies_model.dart';
import 'package:book_my_show/view/seat_select_screen/seat_select_screen.dart';
import 'package:flutter/material.dart';

class TheatreBookingScreen extends StatelessWidget {
  const TheatreBookingScreen({super.key, required this.movie});

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.name,
          style: TextStyle(color: Constants.backgroundColor),
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.grey,
        ),
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
      ),
      backgroundColor: Colors.grey,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Constants.backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      var slots = movie.theatres[index].slots;
                      var theatre = movie.theatres[index];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.favorite_border),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "${movie.theatres[index].theatreName}\n${movie.theatres[index].location}",
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.info_outline_rounded,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "INFO",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Constants.smallGap,
                            Text(
                              movie.theatres[index].cancellation
                                  ? "Cancellation Available"
                                  : "Non-cancellable",
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w300),
                            ),
                            Constants.gap,
                            Container(
                              height: 55,
                              padding: const EdgeInsets.all(4),
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, int indexx) {
                                    return OutlinedButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SeatSelectScreen(theatre: theatre, title: movie.name,)));
                                        },
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Colors.green,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              slots[index].time,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              slots[index].tag,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ));
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 10,
                                    );
                                  },
                                  itemCount: slots.length),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: movie.theatres.length),
              )
            ],
          ),
        ),
      )),
    );
  }
}
