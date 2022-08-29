import 'package:flutter/material.dart';

class NFTlist {
  final String name, image, chain, price;

  NFTlist({
    required this.name,
    required this.image,
    required this.chain,
    required this.price,
  });
}

List<NFTlist> nftList = [
  NFTlist(
    name: "Funny Bird NFT",
    chain: "Soulofox",
    price: "2.4",
    image: "assets/images/nft1.png",
  ),
  NFTlist(
    name: "Funny Bird NFT",
    chain: "Solana",
    price: "4.1",
    image: "assets/images/nft3.png",
  ),
  NFTlist(
    name: "Funny Bird NFT",
    chain: "Soulofox",
    price: "2.4",
    image: "assets/images/nft1.png",
  ),
  NFTlist(
    name: "Megical World",
    chain: "Ethereum",
    price: "4.1",
    image: "assets/images/nft3.png",
  ),
  NFTlist(
    name: "Funny Bird NFT",
    chain: "Solana",
    price: "4.1",
    image: "assets/images/nft3.png",
  ),
  NFTlist(
    name: "Funny Bird NFT",
    chain: "Soulofox",
    price: "2.4",
    image: "assets/images/nft1.png",
  ),
];
