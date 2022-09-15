import 'package:app_metastream/values/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../components/circle_loading.dart';
import '../../../models/game.dart';
import '../../../services/api_game_service.dart';

class AboutProfile extends StatelessWidget {
  const AboutProfile({Key? key, required this.gameId}) : super(key: key);
  final String gameId;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder<Game>(
            future: ApiGameServices().fetchGameById(gameId),
            builder: (context, snapshot) {
              if ((snapshot.hasError) || (!snapshot.hasData))
                return CircleLoading();
              Game? game = snapshot.data;
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      game!.description.toString(),
                      style: AppStyles.about_profile_title_style,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text("Website: ",
                            style: AppStyles.about_profile_label_style),
                        const SizedBox(width: 10),
                        InkWell(
                            child: const Text(
                              'Open Website',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () => launch(game.websiteUrl.toString())),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text("Chain: ",
                            style: AppStyles.about_profile_label_style),
                        const SizedBox(width: 10),
                        Text(
                          game.chainId!.name.toString(),
                          style: AppStyles.about_profile_title_style,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text("Contact: ",
                        style: AppStyles.about_profile_label_style),
                    const SizedBox(height: 10),
                    Row(
                      children: game.tags!
                          .map((item) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/${item.title!.toLowerCase()}.jpeg'),
                                  ),
                                  onTap: () => launch(item.url.toString()),
                                ),
                              ))
                          .toList(),
                    ),
                  ]);
            }),
      ),
    );
  }
}
