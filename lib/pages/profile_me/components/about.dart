import 'package:app_metastream/models/user.dart';
import 'package:app_metastream/services/api_user_service.dart';
import 'package:app_metastream/values/app_styles.dart';
import 'package:flutter/material.dart';
import '../../../components/circle_loading.dart';
import '../../../components/no_content_profile.dart';

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
                  return CircleLoading();
                User? user = snapshot.data;
                return user != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            user!.descriptions.toString(),
                            style: AppStyles.about_profile_title_style,
                          ),
                        ],
                      )
                    : const NoContentProfile(title: "You don't have nft!");
                ;
              }),
        ));
  }
}
