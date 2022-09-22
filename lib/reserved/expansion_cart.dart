import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class ExpansionCart extends StatefulWidget {
  const ExpansionCart({Key? key, required this.nftSolana}) : super(key: key);
  final NftSolana nftSolana;
  @override
  State<ExpansionCart> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<ExpansionCart> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.bgrCardColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ExpansionTile(
            title: Row(
              children: const [
                Icon(
                  Icons.description,
                  size: 24,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Details',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColors.textPrimaryColor),
                ),
              ],
            ),
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Mint address',
                          textAlign: TextAlign.start,
                          style: AppStyles.details_cart_left_nft_style,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(AppAssets.icSol),
                              radius: 10,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${widget.nftSolana.mintAddress.toString().substring(0, 6)}...${widget.nftSolana.mintAddress.toString().substring(widget.nftSolana.mintAddress.toString().length - 6, widget.nftSolana.mintAddress.toString().length)}',
                              textAlign: TextAlign.start,
                              style: AppStyles.details_cart_right_nft_style,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Seller address',
                          textAlign: TextAlign.start,
                          style: AppStyles.details_cart_left_nft_style,
                        ),
                        Row(
                          children: [
                            Text(
                              '${widget.nftSolana.sellerAddress.toString().substring(0, 6)}...${widget.nftSolana.sellerAddress.toString().substring(widget.nftSolana.sellerAddress.toString().length - 6, widget.nftSolana.sellerAddress.toString().length)}',
                              textAlign: TextAlign.start,
                              style: AppStyles.details_cart_right_nft_style,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Token Account',
                          textAlign: TextAlign.start,
                          style: AppStyles.details_cart_left_nft_style,
                        ),
                        Row(
                          children: [
                            Text(
                              '${widget.nftSolana.tokenAccount.toString().substring(0, 6)}...${widget.nftSolana.tokenAccount.toString().substring(widget.nftSolana.tokenAccount.toString().length - 6, widget.nftSolana.tokenAccount.toString().length)}',
                              textAlign: TextAlign.start,
                              style: AppStyles.details_cart_right_nft_style,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              )
            ],
          ),
        ),
        // ExpansionTile(
        //   title: const Text('ExpansionTile 2'),
        //   subtitle: const Text('Custom expansion arrow icon'),
        //   trailing: Icon(
        //     _customTileExpanded
        //         ? Icons.arrow_drop_down_circle
        //         : Icons.arrow_drop_down,
        //   ),
        //   children: const <Widget>[
        //     ListTile(title: Text('This is tile number 2')),
        //   ],
        //   onExpansionChanged: (bool expanded) {
        //     setState(() => _customTileExpanded = expanded);
        //   },
        // ),
      ],
    );
  }
}
