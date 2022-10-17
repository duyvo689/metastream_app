// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/providers/providers.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/utils/utils.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableNFTMagicEden extends StatefulWidget {
  const TableNFTMagicEden({Key? key, required this.tokenMint})
      : super(key: key);
  final String tokenMint;

  @override
  State<TableNFTMagicEden> createState() => _TableNFTMagicEdenState();
}

class _TableNFTMagicEdenState extends State<TableNFTMagicEden> {
  int aboutTime = 0;

  @override
  void initState() {
    fetchMagicEdenNftActivitis(widget.tokenMint);
    super.initState();
  }

  Future fetchMagicEdenNftActivitis(String tokenMint) async {
    await context
        .read<ListActivitieProvider>()
        .GetListActivitieProvider(tokenMint);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.dGreyDarkColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Consumer<ListActivitieProvider>(
          builder: ((context, listActivitie, child) {
            return listActivitie.listActivitie != null
                ? SingleChildScrollView(
                    clipBehavior: Clip.hardEdge,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        DataTable(
                          columns: <DataColumn>[
                            DataColumn(
                              label: _TextHeaderDataColumn(name: 'TYPE'),
                            ),
                            DataColumn(
                              label: _TextHeaderDataColumn(name: 'SELLER'),
                            ),
                            DataColumn(
                              label: _TextHeaderDataColumn(name: 'BUYER'),
                            ),
                            DataColumn(
                              label: _TextHeaderDataColumn(name: 'PRICE'),
                            ),
                            DataColumn(
                              label: _TextHeaderDataColumn(name: 'TIME'),
                            ),
                            DataColumn(
                              label: _TextHeaderDataColumn(name: 'ACTIONS'),
                            ),
                          ],
                          rows: <DataRow>[
                            ...List.generate(
                              listActivitie.listActivitie!.length,
                              (index) => TableCell(
                                  solanaTx:
                                      listActivitie.listActivitie![index]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: 60, child: const SquareSkeleton(height: 40));
          }),
        ));
  }
}

Text _TextHeaderDataColumn({required String name}) {
  return Text(
    name,
    style: PrimaryFont.medium(16).copyWith(color: AppColors.dGreyLightColor),
  );
}

DataRow TableCell({required MagicEdenNftActivities solanaTx}) {
  return DataRow(
    cells: <DataCell>[
      DataCell(Text(
          '${solanaTx.type == 'list' ? 'Listing' : solanaTx.type == 'cancelBid' ? 'Cancel Bid' : solanaTx.type == 'buyNow' ? 'Buy Now' : solanaTx.type == 'bid' ? 'Bid' : solanaTx.type}',
          style: solanaTx.type.toString() == 'list'
              ? const TextStyle(color: AppColors.dPrimaryColor)
              : solanaTx.type.toString() == 'cancelBid'
                  ? const TextStyle(color: Colors.red)
                  : const TextStyle(color: Colors.white))),
      DataCell(Text(solanaTx.tokenMint != null
          ? '${solanaTx.tokenMint.toString().substring(0, 4)}...${solanaTx.tokenMint.toString().substring(solanaTx.tokenMint.toString().length - 4, solanaTx.tokenMint.toString().length)}'
          : '...')),
      DataCell(Text(solanaTx.buyer != null
          ? '${solanaTx.buyer.toString().substring(0, 4)}...${solanaTx.buyer.toString().substring(solanaTx.buyer.toString().length - 4, solanaTx.buyer.toString().length)}'
          : '...')),
      DataCell(Text(
          '${solanaTx.price != null ? solanaTx.price.toString() : '...'} SOL')),
      // DataCell(Text(
      //     '${DateTime.fromMillisecondsSinceEpoch(solanaTx.blockTime! * 1000)}')),
      DataCell(Text(
        '${readTimestamp(solanaTx.blockTime)}',
        style: const TextStyle(color: AppColors.dPrimaryColor),
      )),
      DataCell(OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          primary: AppColors.dGreyLightColor,
          side: BorderSide(color: AppColors.dGreyLightColor, width: 1),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        label: const Text(
          'VIEW',
          style: TextStyle(fontSize: 12),
        ),
        icon: const Icon(
          Icons.open_in_new_outlined,
          size: 16,
        ),
        onPressed: () {
          // Respond to button press
        },
      )),
    ],
  );
}
