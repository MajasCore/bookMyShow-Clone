
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class CustomBottomNavSeatSelect extends StatelessWidget {
  const CustomBottomNavSeatSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        color: Constants.backgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            SeatStatus(
              title: "Available",
              borderColor: Colors.green,
              fillColor: Colors.transparent,
            ),
            SeatStatus(
              title: "Selected",
              borderColor: Colors.green,
              fillColor: Colors.green,
            ),
            SeatStatus(
              title: "Sold",
              borderColor: Colors.grey,
              fillColor: Colors.grey,
            )
          ],
        ));
  }
}


class SeatStatus extends StatelessWidget {
  const SeatStatus({
    super.key,
    required this.borderColor,
    required this.fillColor,
    required this.title,
  });

  final Color borderColor;
  final Color fillColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(2),
            color: fillColor,
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(title),
      ],
    );
  }
}
