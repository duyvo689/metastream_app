import 'dart:convert';
import 'dart:ui';

import 'package:bs58/bs58.dart';
import 'package:flutter/material.dart';
import 'package:pinenacl/x25519.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../values/app_assets.dart';
import 'deep_link_provider.dart';

class PhanTomWallet extends StatefulWidget {
  const PhanTomWallet({Key? key}) : super(key: key);

  @override
  State<PhanTomWallet> createState() => _PhanTomWalletState();
}

class _PhanTomWalletState extends State<PhanTomWallet> {
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
        'redirect_link': '',
        // 'https://phantom.app/ul/browse/https://magiceden.io/item-details/ED8Psf2Zk2HyVGAimSQpFHVDFRGDAkPjQhkfAqbN5h7d',
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

    session = data["session"];
    walletAddr = data["public_key"];

    logs.add(
      Text(
        "Wallet address: ${data["public_key"].toString().substring(0, 16)}...",
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
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
        'redirect_link':
            'https://beta.metastream.network/NFT/solana/3bqfzDUBhoa1rq6nw2DPbjXzvhzZbBswHMcN1fgyfjXk',
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
    return StreamBuilder<String>(
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
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawMaterialButton(
              onPressed: _connect,
              child: Image.asset(
                AppAssets.icPhantom,
                height: 40,
                width: 40,
              ),
            ),
          ],
        );
      },
    );
  }
}
