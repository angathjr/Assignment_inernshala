import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:internshala_assignment/controllers/destination_controller.dart';
import 'package:internshala_assignment/views/widgets/popular_trek_widget.dart';

class DestinationScreen extends StatelessWidget {
  DestinationScreen({super.key});

  final DestinationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => (controller.isLoading.value == true)
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: width * 0.09,
                          height: width * 0.09,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: width * 0.04,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: width * 0.09,
                          height: width * 0.09,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: width * 0.05,
                          ),
                        )
                      ],
                    ),
                    expandedHeight: height * 0.35,
                    flexibleSpace: FlexibleSpaceBar(
                      background:

                          //the slider comes here as carousel slider

                          SizedBox(
                        width: width,
                        child: CarouselSlider.builder(
                            itemCount:
                                controller.lakes.value.bannerImages!.length,
                            itemBuilder: (context, index, realIndex) {
                              return ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                                child: Image.network(
                                  controller.lakes.value.bannerImages![index],
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                            options: CarouselOptions(
                                autoPlay: true,
                                disableCenter: true,
                                viewportFraction: 1)),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        //rating section

                        RatingBar.builder(
                          initialRating: controller.lakes.value.rating!,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              EdgeInsets.symmetric(horizontal: width * 0.004),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "${controller.lakes.value.description}",
                          style: TextStyle(
                              fontSize: width * 0.042, color: Colors.grey),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: width * 0.02,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: width * 0.09,
                                  ),
                                  Expanded(
                                    child: Text(
                                        controller.lakes.value.details![index],
                                        softWrap: true,
                                        style: TextStyle(
                                            fontSize: width * 0.037,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600)),
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: controller.lakes.value.details!.length,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Popular Treks",
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w600),
                        ),

                        SizedBox(
                          height: height * 0.2,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) => PopularTrekWidget(
                                  width: width,
                                  height: height,
                                  controller: controller,
                                  index: index,
                                )),
                            itemCount:
                                controller.lakes.value.popularTreks!.length,
                          ),
                        ),

                        //added space for just to scroll and make sure the slider collapses
                        SizedBox(
                          height: height * 0.4,
                        )
                      ]),
                    ),
                  ),
                ],
              ),
      )),
    );
  }
}
