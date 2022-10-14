// ignore_for_file: prefer_is_empty, avoid_unnecessary_containers

import 'package:app_metastream/components/loading.dart';
import 'package:app_metastream/providers/providers.dart';
import 'package:app_metastream/values/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import '../pages/game_detail/game_detail.dart';

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
  @override
  void initState() {
    super.initState();
    FetchBanner();
  }

  Future FetchBanner() async {
    await context.read<BannerProvider>().GetBannerProvider();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child:
          Consumer<BannerProvider>(builder: (context, bannerConsumer, child) {
        return bannerConsumer.banners.length > 0
            ? Column(children: [
                Container(
                  child: CarouselSlider(
                    items: bannerConsumer.banners
                        .map((item) => InkWell(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: GameDetail(
                                    gameId: item.gameId,
                                  ),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.all(0),
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5.0)),
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom:
                                                        BorderSide(width: 18)),
                                                color: Color.fromARGB(
                                                    255, 24, 24, 24))),
                                        // Image.network(
                                        //   item.assetUrl.toString(),
                                        //   fit: BoxFit.cover,
                                        //   width: 1000.0,
                                        //   errorBuilder:
                                        //       (context, error, stackTrace) =>
                                        //           const LoadingCenter(),
                                        // ),
                                        CachedNetworkImage(
                                          imageUrl: item.assetUrl.toString(),
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
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
                                          bottom:
                                              getProportionateScreenHeight(50),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.name.toString(),
                                                  style: PrimaryFont.medium(26)
                                                      .copyWith(
                                                          color: AppColors
                                                              .dWhileColor),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  item.description.toString(),
                                                  maxLines: 3,
                                                  style: PrimaryFont.light(14)
                                                      .copyWith(
                                                          color: AppColors
                                                              .dGreyLightColor,
                                                          height: 1.2),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ))
                        .toList(),
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1.7,
                        enlargeCenterPage: true,
                        initialPage: 2,
                        viewportFraction: widget.viewport,
                        onPageChanged: (index, reason) {
                          if (!mounted) return;
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: widget.style == 'start'
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: context
                      .read<BannerProvider>()
                      .banners
                      .asMap()
                      .entries
                      .map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: widget.width,
                        height: widget.height,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ])
            : SquareSkeleton(
                height: size.width < 600 ? 260 : 500,
              );
      }),
    );
  }
}
