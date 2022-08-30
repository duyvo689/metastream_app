import 'package:app_metastream/values/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../values/app_assets.dart';
import '../../../values/app_colors.dart';

class ExpansionCart extends StatefulWidget {
  const ExpansionCart({Key? key}) : super(key: key);

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
                  size: 26,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Details',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
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
                              radius: 12,
                            ),
                            const SizedBox(width: 2),
                            CircleAvatar(
                              backgroundImage: AssetImage(AppAssets.icEth),
                              radius: 10,
                            ),
                            const SizedBox(width: 2),
                            CircleAvatar(
                              backgroundImage: AssetImage(AppAssets.icBsc),
                              radius: 14,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              'GgQQ1 ... uBy',
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
                          'Token address',
                          textAlign: TextAlign.start,
                          style: AppStyles.details_cart_left_nft_style,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(AppAssets.icSol),
                              radius: 12,
                            ),
                            const SizedBox(width: 2),
                            CircleAvatar(
                              backgroundImage: AssetImage(AppAssets.icEth),
                              radius: 10,
                            ),
                            const SizedBox(width: 2),
                            CircleAvatar(
                              backgroundImage: AssetImage(AppAssets.icBsc),
                              radius: 14,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              '63Wuy ... MHS',
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
                          'Owner',
                          textAlign: TextAlign.start,
                          style: AppStyles.details_cart_left_nft_style,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(AppAssets.icSol),
                              radius: 12,
                            ),
                            const SizedBox(width: 2),
                            CircleAvatar(
                              backgroundImage: AssetImage(AppAssets.icEth),
                              radius: 10,
                            ),
                            const SizedBox(width: 2),
                            CircleAvatar(
                              backgroundImage: AssetImage(AppAssets.icBsc),
                              radius: 14,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              'Br1qa ... RpX',
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
                      children: const [
                        Text(
                          'Artist Royalties',
                          textAlign: TextAlign.start,
                          style: AppStyles.details_cart_left_nft_style,
                        ),
                        Text(
                          '5%',
                          textAlign: TextAlign.start,
                          style: AppStyles.details_cart_right_nft_style,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Transaction Fee',
                          textAlign: TextAlign.start,
                          style: AppStyles.details_cart_left_nft_style,
                        ),
                        Text(
                          '2%',
                          textAlign: TextAlign.start,
                          style: AppStyles.details_cart_right_nft_style,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Listing/Bidding/Cancel',
                          textAlign: TextAlign.start,
                          style: AppStyles.details_cart_left_nft_style,
                        ),
                        Text(
                          'Free',
                          textAlign: TextAlign.start,
                          style: AppStyles.details_cart_right_nft_style,
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
