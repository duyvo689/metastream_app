import 'package:app_metastream/values/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../pages/game_detail/game_detail.dart';

import '../models/banner.dart';
import '../services/api_banner_service.dart';
import '../values/app_size.dart';
import 'skeleton.dart';

class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator(
      {Key? key,
      required this.viewport,
      required this.width,
      required this.height,
      required this.style})
      : super(key: key);
  final double viewport;
  final double width;
  final double height;
  final String style;
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<Carousel> banners = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        FutureBuilder<List<Carousel>>(
          future: ApiBannerServices().fetchBanner(),
          builder: (context, snapshot) {
            if ((snapshot.hasError) || (!snapshot.hasData))
              return SquareSkeleton(
                height: 5,
              );
            List<Carousel>? Carousels = snapshot.data;
            if (banners.length <= 0) {
              for (int i = 0; i < Carousels!.length; i++) {
                if (Carousels[i].type == 'image') {
                  banners = [...banners, Carousels[i]];
                }
              }
            }
            return Container(
              child: CarouselSlider(
                items: banners
                    .map((item) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GameDetail(
                                          gameId: item.gameId,
                                        )));
                          },
                          child: Container(
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(
                                        item.assetUrl.toString(),
                                        fit: BoxFit.cover,
                                        width: 1000.0,
                                        height: 220,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                              Colors.black.withOpacity(1),
                                              Colors.black.withOpacity(0.01)
                                            ])),
                                      ),
                                      Positioned(
                                        left: 0.0,
                                        right: 0.0,
                                        top: getProportionateScreenHeight(50),
                                        bottom:
                                            getProportionateScreenHeight(50),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.name.toString(),
                                                style: const TextStyle(
                                                  color: AppColors
                                                      .textPrimaryColor,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                item.description.toString(),
                                                maxLines: 3,
                                                style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color:
                                                      AppColors.textSecondColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ))
                    .toList(),
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: widget.viewport,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: widget.style == 'start'
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: banners.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: widget.width,
                height: widget.height,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
