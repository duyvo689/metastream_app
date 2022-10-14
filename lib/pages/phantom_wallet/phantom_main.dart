import 'dart:convert';
import 'package:app_metastream/providers/providers.dart';
import 'package:app_metastream/pages/profile_me/form_info_user.dart';
import 'package:app_metastream/pages/profile_me/profile_me.dart';
import 'package:app_metastream/values/values.dart';
import 'package:bs58/bs58.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pinenacl/x25519.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'deep_link_provider.dart';

class WalletPhanTom extends StatefulWidget {
  const WalletPhanTom({Key? key}) : super(key: key);

  @override
  State<WalletPhanTom> createState() => _MainAppState();
}

class _MainAppState extends State<WalletPhanTom> {
  final List<Widget> logs = [];

  late PrivateKey sk;
  late PublicKey pk;
  String walletAddr = '';
  String walletAddrFull = '';
  String session = '';
  late Box sharedSecret;

  @override
  void initState() {
    super.initState();
    sk = PrivateKey.generate();
    pk = sk.publicKey;
  }

  void _connect() async {
    Uri url = Uri(
      scheme: 'https',
      host: 'phantom.app',
      path: '/ul/v1/connect',
      queryParameters: {
        'dapp_encryption_public_key': base58.encode(pk.asTypedList),
        'cluster': "mainnet-beta",
        'app_url': "https://phantom.app",
        'redirect_link': 'metastreamphantom://deeplink.connect',
      },
    );
    launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  _onConnect(Map params) async {
    sharedSecret = Box(
      myPrivateKey: sk,
      theirPublicKey: PublicKey(
        base58.decode(
          params["phantom_encryption_public_key"],
        ),
      ),
    );

    final decryptedData = sharedSecret.decrypt(
      ByteList(base58.decode(
        params["data"],
      )),
      nonce: base58.decode(params["nonce"]),
    );

    Map data = const JsonDecoder().convert(String.fromCharCodes(decryptedData));
    // walletAddr =
    //     '${data["public_key"].toString().substring(0, 4)}...${data["public_key"].toString().substring(data["public_key"].toString().length - 4, data["public_key"].toString().length)}';
    walletAddrFull = data["public_key"].toString();

    // logs.add(
    //   Text(
    //     "Wallet address: ${data["public_key"].toString()}",
    //     style: const TextStyle(
    //       color: Colors.white,
    //     ),
    //   ),
    // );
  }

  void _disconnect() async {
    JsonEncoder encoder = const JsonEncoder();
    Map payload = {
      "session": session,
    };
    String payloadJson = encoder.convert(payload);

    var nonce = PineNaClUtils.randombytes(24);

    var _encoder;
    var _box;
    final encryptedMsg = _box
        .encrypt(
          _encoder.convert(payload).codeUnits.toUint8List(),
          nonce: nonce,
        )
        .cipherText;

    Uri url = Uri(
      scheme: 'https',
      host: 'phantom.app',
      path: '/ul/v1/disconnect',
      queryParameters: {
        'dapp_encryption_public_key': base58.encode(pk.asTypedList),
        'nonce': base58.encode(encryptedMsg.nonce.toUint8List()),
        'payload': base58.encode(encryptedMsg.toUint8List()),
        'redirect_link': 'metastreamphantom://deeplink.disconnect',
      },
    );
    launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    DeepLinkProvider provider = DeepLinkProvider();
    return Scaffold(
      backgroundColor: AppColors.dBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.dBlackColor,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: context.watch<UserInfo>().userInfo != null
                ? IconButton(
                    onPressed: () {
                      pushNewScreen(
                        context,
                        screen: const FormAddInfoUser(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    icon: const Icon(
                      Icons.manage_accounts,
                      size: 30,
                    ))
                : const SizedBox.shrink(),
          )
        ],
      ),
      body: StreamBuilder<String>(
        stream: provider.state,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Uri redirectedUri = Uri.parse(snapshot.data!);
            Map params = redirectedUri.queryParameters;
            if (params.containsKey("errorCode")) {
              print(params["errorMessage"]);
            } else {
              switch (redirectedUri.host.split('.')[1]) {
                case 'connect':
                  _onConnect(params);
                  break;
                case 'disconnect':
                  print('disconnected');
                  break;
                default:
              }
            }
          }
          return walletAddrFull == '' &&
                  context.watch<UserInfo>().userInfo == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage(
                          'assets/icons/ic_phantom.png',
                        ),
                        height: 80,
                        width: 890,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'No wallets found',
                        style: PrimaryFont.medium(20)
                            .copyWith(color: AppColors.dWhileColor),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: _connect,
                        icon: const Icon(
                          Icons.account_balance_wallet,
                          size: 20,
                        ),
                        label: const Text('Connect Phantom'),
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.dWhileColor,
                            onPrimary: AppColors.dGreyLightColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                )
              : ProfileMe(walletAddr: walletAddrFull);
        },
      ),
    );
  }
}


                      // ElevatedButton(
                      //   onPressed: () => walletAddr == ""
                      //       ? ScaffoldMessenger.of(context).showSnackBar(
                      //           const SnackBar(
                      //             content: Text(
                      //               "Please connect wallet first",
                      //             ),
                      //             duration: Duration(seconds: 2),
                      //           ),
                      //         )
                      //       : _disconnect(),
                      //   child: const Text("Disconnect"),
                      // ),

