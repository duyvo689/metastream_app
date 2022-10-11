import 'package:app_metastream/models/magicedennft_detail_model.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NFTCardMagicEden extends StatefulWidget {
  const NFTCardMagicEden({
    Key? key,
    required this.nft,
    this.isFullCard = false,
    required this.press,
  }) : super(key: key);

  final MagicEdenNft nft;
  final bool isFullCard;
  final GestureTapCallback press;

  @override
  State<NFTCardMagicEden> createState() => _NFTCardMagicEdenState();
}

class _NFTCardMagicEdenState extends State<NFTCardMagicEden> {
  MagicEdenNftDetail? nftDetail;

  @override
  void initState() {
    fetchNftMagicEdenNftsDetail(widget.nft.tokenMint.toString());
    super.initState();
  }

  Future fetchNftMagicEdenNftsDetail(String tokenMint) async {
    MagicEdenNftDetail nft =
        await ApiCollectionServices().fetchTokenListingDataMagicEden(tokenMint);
    setState(() {
      nftDetail = nft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border.all(
                color: const Color.fromARGB(255, 51, 50, 50), width: 2),
            color: AppColors.dBlackColor.withOpacity(0.3)),
        child: SizedBox(
          width: getProportionateScreenWidth(150),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        image: DecorationImage(
                            image:
                                NetworkImage(widget.nft.extra!.img.toString()),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: getProportionateScreenWidth(150),
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nftDetail != null && nftDetail!.name != null
                          ? nftDetail!.name.toString()
                          : '...',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${widget.nft.tokenMint.toString().substring(0, 4)}...${widget.nft.tokenMint.toString().substring(widget.nft.tokenMint.toString().length - 4, widget.nft.tokenMint.toString().length)}',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        color: AppColors.dPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/solana-sol-icon.svg',
                          semanticsLabel: 'sol',
                          width: 18,
                          height: 18,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          // nft.price != null ? '${nft.price}' : '...',
                          '${widget.nft.price}',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                            color: AppColors.dWhileColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
