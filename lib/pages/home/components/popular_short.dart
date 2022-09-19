import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';
import 'section_title.dart';
import 'short_card.dart';

class PopularShorts extends StatelessWidget {
  const PopularShorts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const SectionTitle(
            title_1: "Videos",
            title_2: "Short",
          ),
          const SizedBox(
            height: 30,
          ),
          FutureBuilder<List<Video>>(
            future: ApiVideoServices().fetchVideos(),
            builder: (context, snapshot) {
              if ((snapshot.hasError) || (!snapshot.hasData))
                return Container(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) => CardSkeleton(),
                  ),
                );
              List<Video>? videos = snapshot.data;
              return (SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      videos!.length,
                      (index) => ShortCard(
                        video: videos[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShortVideo(
                                      video: videos[index],
                                    ))),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ));
            },
          ),
        ],
      ),
    );
  }
}
