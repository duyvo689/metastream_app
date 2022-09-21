import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import 'categories.dart';
import 'header_profile.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.walletAddr}) : super(key: key);
  final String walletAddr;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    // Future<User> userInfo =
    //     ApiUserServices().fetchUserByWalletAddress(widget.walletAddr);
    // print(userInfo);
    // context.read<UserInfo>().increment(userInfo);
    FethUser(widget.walletAddr);
  }

  void FethUser(String walletAddr) async {
    User userInfo =
        await ApiUserServices().fetchUserByWalletAddress(widget.walletAddr);
    // ignore: use_build_context_synchronously
    context.read<UserInfo>().increment(userInfo);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(children: [
      FutureBuilder<User>(
          future: ApiUserServices().fetchUserByWalletAddress(widget.walletAddr),
          builder: (context, snapshot) {
            if ((snapshot.hasError) || (!snapshot.hasData))
              // ignore: curly_braces_in_flow_control_structures
              return const CircleLoading();
            User? user = snapshot.data;
            return SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  HeaderProflie(user: user as User),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.4),
                    decoration: const BoxDecoration(
                      color: AppColors.bgrCardColor, // video
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Categories(
                            userId: user.id.toString(),
                            addressWallet: widget.walletAddr)
                      ],
                    ),
                  ),
                ],
              ),
            );
          })
    ]));
  }
}
