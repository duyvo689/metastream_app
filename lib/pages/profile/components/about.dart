import 'package:app_metastream/models/user.dart';
import 'package:app_metastream/pages/profile/components/video_list.dart';
import 'package:app_metastream/services/api_user_service.dart';
import 'package:app_metastream/values/app_colors.dart';
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
        child: FutureBuilder<User>(
            future: ApiUserServices().fetchUserById(userId),
            builder: (context, snapshot) {
              if ((snapshot.hasError) || (!snapshot.hasData))
                return ParagraphSkeleton(
                  line: 7,
                  height: 30,
                );
              User? user = snapshot.data;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    // Row(
                    //   children: [
                    //     const Text("First name: ",
                    //         style: AppStyles.about_profile_label_style),
                    //     const SizedBox(width: 10),
                    //     Text(
                    //       user!.firstName.toString(),
                    //       style: AppStyles.about_profile_title_style,
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 20),
                    // Row(
                    //   children: [
                    //     const Text("Last name: ",
                    //         style: AppStyles.about_profile_label_style),
                    //     const SizedBox(width: 10),
                    //     Text(
                    //       user.lastName.toString(),
                    //       style: AppStyles.about_profile_title_style,
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 20),
                    // Row(
                    //   children: [
                    //     const Text("User Name: ",
                    //         style: AppStyles.about_profile_label_style),
                    //     const SizedBox(width: 10),
                    //     Text(
                    //       user.userName.toString(),
                    //       style: AppStyles.about_profile_title_style,
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 20),
                    // Row(
                    //   children: [
                    //     const Text("Email: ",
                    //         style: AppStyles.about_profile_label_style),
                    //     const SizedBox(width: 10),
                    //     Text(
                    //       user.email.toString(),
                    //       style: AppStyles.about_profile_title_style,
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                    ),
                  ],
                ),
              );
            }));
  }
}
