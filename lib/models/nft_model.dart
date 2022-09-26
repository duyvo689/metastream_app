class NFT {
  final String name, image, chain, price;

  NFT({
    required this.name,
    required this.image,
    required this.chain,
    required this.price,
  });
}

List<NFT> nfts = [
  NFT(
    name: "Primate #4160",
    chain: "Solana",
    price: "0.6",
    image: "assets/images/nft1.png",
  ),
  NFT(
    name: "Smetanas #239",
    chain: "Solana",
    price: "0.4",
    image: "assets/images/nft2.webp",
  ),
  NFT(
    name: "DeMobs #51",
    chain: "Solana",
    price: "0.3",
    image: "assets/images/nft3.webp",
  ),
  NFT(
    name: "infected Mob #1151",
    chain: "Solana",
    price: "0.9",
    image: "assets/images/nft4.png",
  ),
];
