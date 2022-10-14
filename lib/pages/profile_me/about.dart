import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/providers/providers.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutProfile extends StatelessWidget {
  const AboutProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<UserInfo>(
        builder: (context, userInfoConsumer, child) {
          return userInfoConsumer.userInfo != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        userInfoConsumer.userInfo!.descriptions.toString(),
                        style: AppStyles.about_profile_title_style,
                      ),
                    ],
                  ))
              : const Loading(scale: 6);
          ;
        },
      ),
    );
  }
}
