import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class AboutProfile extends StatelessWidget {
  const AboutProfile({Key? key, required this.gameId}) : super(key: key);
  final String gameId;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder<Game>(
              future: ApiGameServices().fetchGameById(gameId),
              builder: (context, snapshot) {
                if ((snapshot.hasError) || (!snapshot.hasData))
                  // ignore: curly_braces_in_flow_control_structures
                  return const Loading();
                Game? game = snapshot.data;
                return game != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            const SizedBox(height: 20),
                            Text(
                              game.description.toString(),
                              style: AppStyles.about_profile_title_style,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Text("Website: ",
                                    style: AppStyles.about_profile_label_style),
                                const SizedBox(width: 10),
                                Text(
                                  game.websiteUrl.toString(),
                                  style: AppStyles.about_profile_title_style,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Text("Network: ",
                                    style: AppStyles.about_profile_label_style),
                                const SizedBox(width: 10),
                                Text(
                                  game.chainId!.name.toString(),
                                  style: AppStyles.about_profile_title_style,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Text("Developer: ",
                                    style: AppStyles.about_profile_label_style),
                                const SizedBox(width: 10),
                                Text(
                                  game.developer!.name.toString(),
                                  style: AppStyles.about_profile_title_style,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Text("Release Status: ",
                                    style: AppStyles.about_profile_label_style),
                                const SizedBox(width: 10),
                                Text(
                                  game.release!.toString(),
                                  style: AppStyles.about_profile_title_style,
                                ),
                              ],
                            ),
                            // const Text("Contact: ",
                            //     style: AppStyles.about_profile_label_style),
                            // const SizedBox(height: 10),
                            // Row(
                            //   children: game.tags!
                            //       .map((item) => Padding(
                            //             padding: const EdgeInsets.only(right: 10),
                            //             child: InkWell(
                            //               child: CircleAvatar(
                            //                 backgroundImage: AssetImage(
                            //                     'assets/images/${item.title!.toLowerCase()}.jpeg'),
                            //               ),
                            //               onTap: () => launch(item.url.toString()),
                            //             ),
                            //           ))
                            //       .toList(),
                            // ),
                          ])
                    : const NoContentProfile(title: "Game don't have about!");
              }),
        ),
      ),
    );
  }
}
