import 'package:book_my_show/model/movies_model.dart';
import 'package:book_my_show/view/seat_select_screen/seat_select_screen_componets/custom_seat_select_bn.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class SeatSelectScreen extends StatefulWidget {
  const SeatSelectScreen(
      {super.key, required this.theatre, required this.title});
  final Theatre theatre;
  final String title;

  @override
  State<SeatSelectScreen> createState() => _SeatSelectScreenState();
}

class _SeatSelectScreenState extends State<SeatSelectScreen> {
  @override
  Widget build(BuildContext context) {
    final transformationController = TransformationController();

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavSeatSelect(),
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(color: Constants.backgroundColor),
            ),
            Text(
              widget.theatre.theatreName,
              style: TextStyle(color: Constants.backgroundColor, fontSize: 8),
            ),
          ],
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
      backgroundColor: Colors.grey[50],
      body: InteractiveViewer(
          constrained: false,
          transformationController: transformationController,
          boundaryMargin: const EdgeInsets.all(double.infinity),
          minScale: 0.1,
          maxScale: 1.6,
          onInteractionEnd: (details) {
            setState(() {
              transformationController.toScene(Offset.zero);
            });
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size(900, 500)),
                        child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var first =
                                  widget.theatre.seating[0].column[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        child: Center(
                                          child: Text(
                                            first.id,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return first.seats[index].show
                                                  ? Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: first
                                                                      .seats[
                                                                          index]
                                                                      .sold
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .green),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          color: first
                                                                  .seats[index]
                                                                  .sold
                                                              ? Colors.grey
                                                              : Colors
                                                                  .transparent),
                                                      child: Center(
                                                        child: Text(
                                                          first.seats[index].id
                                                              .toString(),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      height: 30,
                                                      width: 30,
                                                      color: Colors.transparent,
                                                    );
                                            },
                                            separatorBuilder: (context, index) {
                                              return const SizedBox(
                                                width: 4,
                                              );
                                            },
                                            itemCount: first.seats.length),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: Center(
                                          child: Text(
                                            first.id,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: widget.theatre.seating[0].column.length))
                  ],
                ),
                SizedBox(
                  height: 80,
                  width: 200,
                  child: Image.asset(
                    "assets/screen.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const Text("All eeyes this way please!")
              ],
            ),
          )),
    );
  }
}
