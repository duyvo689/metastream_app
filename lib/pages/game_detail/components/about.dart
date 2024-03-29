import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class AboutProfile extends StatelessWidget {
  const AboutProfile({Key? key, required this.game}) : super(key: key);
  final Game? game;
  @override
  Widget build(BuildContext context) {
    print(game);
    return Expanded(
        flex: 1,
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: game?.description != null && game?.description != 'null'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            const SizedBox(height: 20),
                            Text(
                              game!.description.toString(),
                              style: AppStyles.about_profile_title_style,
                            ),
                            const SizedBox(height: 10),
                            const Divider(color: Colors.grey),
                            const SizedBox(height: 10),
                            _aboutItemGame(
                              label: 'Network:',
                              description: game?.chainId != null &&
                                      game?.chainId?.name != null
                                  ? game!.chainId!.name.toString()
                                  : '...',
                            ),
                            const SizedBox(height: 20),
                            _aboutItemGame(
                              label: 'Developer:',
                              description: game!.developer!.name.toString(),
                            ),
                            const SizedBox(height: 20),
                            _aboutItemGame(
                              label: 'Release Status:',
                              description: game!.release!.toString(),
                            ),
                            const SizedBox(height: 10),
                            _aboutItemGame(
                              label: 'Website:',
                              description: game!.websiteUrl.toString(),
                            ),
                          ])
                    : const NoContentProfile(
                        title: "Game don't have about!"))));
  }
}

class _aboutItemGame extends StatelessWidget {
  const _aboutItemGame({
    Key? key,
    required this.label,
    required this.description,
  }) : super(key: key);

  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return description != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: AppStyles.about_profile_label_style),
              const SizedBox(width: 10),
              Text(
                description,
                style: AppStyles.about_profile_title_style,
              ),
            ],
          )
        : Text('...');
  }
}
