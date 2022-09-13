import 'dart:convert';
import 'package:bs58/bs58.dart';
import 'package:flutter/material.dart';
import 'package:pinenacl/x25519.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../values/app_colors.dart';
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
  String walletAddr = "";
  String session = "";
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
    setState(() {
      session = data["session"];
      walletAddr =
          '${data["public_key"].toString().substring(0, 4)}...${data["public_key"].toString().substring(data["public_key"].toString().length - 4, data["public_key"].toString().length)}';
    });
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
    return SafeArea(
      child: StreamBuilder<String>(
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
          return walletAddr == ''
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage(
                          'assets/images/logo-metastream.png',
                        ),
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'No wallets found',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textPrimaryColor,
                        ),
                      ),
                      TextButton(
                          onPressed: _connect,
                          style: TextButton.styleFrom(
                            primary: AppColors.textSecondColor,
                          ),
                          child: const Text('Connect Phantom',
                              style: TextStyle(fontSize: 16))),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                walletAddr,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.textPrimaryColor,
                                ),
                              ),
                              const Icon(
                                Icons.delete_outline,
                                size: 28,
                                color: AppColors.textSecondColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
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