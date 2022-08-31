import 'package:app_metastream/values/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../values/app_size.dart';

final List<String> imgList = [
  'https://vcdn-sohoa.vnecdn.net/2021/08/02/axie-screen1-1536x960-5711-162-8512-4162-1627846443.png',
  'https://gamek.mediacdn.vn/133514250583805952/2021/7/31/photo-1-16277436623992136072459.png',
  'https://www.bravestars.com/uploads/anh-banner-down-size.png',
  'https://media.yeah1.com/files/uploads/editors/59/2021/11/05/064eSI7Xkz5l4TkDsUy6Rq5UrLxLydNxTwlIIrSQ.jpg',
  'https://lh4.googleusercontent.com/j2Az0tpcfFDGtrvN7zEepFR6B53AKk99CtIt2U92LGXRYAjvptcR_xESnr4QDfgvyfGZXQcC5qxX9I_62U5QeYTf004IMbrAALYK3uroMu93dworgip5zDmyeB-bhYA9DfgLdFf-HOGXUb5MOg'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
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
                      bottom: getProportionateScreenHeight(50),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Metastream Nextwork',
                              style: TextStyle(
                                color: AppColors.textPrimaryColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'The platform also features Gamefi elements since it allows users to engage to earn.',
                              style: TextStyle(
                                color: AppColors.textSecondColor,
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
        ))
    .toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 0.8,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 36.0,
                height: 3.0,
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
