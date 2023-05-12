import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../controllers/destination_controller.dart';

class PopularTrekWidget extends StatelessWidget {
  const PopularTrekWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.controller,
      required this.index});

  final double width;
  final double height;
  final DestinationController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.01),
      child: Container(
        width: width * 0.33,
        height: height * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  controller.lakes.value.popularTreks![index].thumbnail!,
                ))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              controller.lakes.value.popularTreks![index].title!,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
            RatingBar.builder(
              itemSize: width * 0.05,
              initialRating: controller.lakes.value.rating!,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star_rate_rounded,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
          ],
        ),
      ),
    );
  }
}
