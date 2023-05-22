
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../model/movies_model.dart';
import '../../theatre_booking_screen/theatre_booking_screen.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.movie,
  });
  
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>  TheatreBookingScreen(movie: movie,)));
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
            backgroundColor: MaterialStateProperty.all(Constants.starColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ))),
        child: const Text(
          "Book Tickets",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
