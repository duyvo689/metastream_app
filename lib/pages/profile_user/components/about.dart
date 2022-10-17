import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class AboutProfile extends StatelessWidget {
  const AboutProfile({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: user.descriptions != null &&
                        user.descriptions != '' &&
                        user.descriptions != 'null'
                    ? Column(
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            user.descriptions.toString(),
                            style: AppStyles.about_profile_title_style,
                          ),
                        ],
                      )
                    : const NoContentProfile(title: "No about!"))));
  }
}
