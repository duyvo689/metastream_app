import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';

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
                  // ignore: curly_braces_in_flow_control_structures
                  return const CircleLoading();
                User? user = snapshot.data;
                return user != null && user.descriptions != ''
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            user.descriptions.toString(),
                            style: AppStyles.about_profile_title_style,
                          ),
                        ],
                      )
                    : NoContentProfile(
                        title: "${user!.userName} don't have about!");
                ;
              }),
        ));
  }
}
