import 'package:app_metastream/models/user.dart';
import 'package:app_metastream/services/api_user_service.dart';
import 'package:app_metastream/values/app_styles.dart';
import 'package:flutter/material.dart';
import '../../../components/skeleton.dart';

class AboutProfile extends StatelessWidget {
  const AboutProfile({Key? key, required this.userId}) : super(key: key);
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder<User>(
              future: ApiUserServices().fetchUserById(userId),
              builder: (context, snapshot) {
                if ((snapshot.hasError) || (!snapshot.hasData))
                  return ParagraphSkeleton(
                    line: 7,
                    height: 30,
                  );
                User? user = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Description: ",
                        style: AppStyles.about_profile_label_style),
                    const SizedBox(height: 10),
                    Text(
                      user!.descriptions.toString(),
                      style: AppStyles.about_profile_title_style,
                    ),
                  ],
                );
              }),
        ));
  }
}
