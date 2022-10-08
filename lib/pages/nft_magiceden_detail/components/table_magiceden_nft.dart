// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class TableNFTMagicEden extends StatelessWidget {
  const TableNFTMagicEden({Key? key, required this.tokenMint})
      : super(key: key);
  final String tokenMint;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.dGreyDarkColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: FutureBuilder<List<MagicEdenNftActivities>>(
        future: ApiCollectionServices().fetchMagicEdenNftActivitis(tokenMint),
        builder: (context, snapshot) {
          if ((snapshot.hasError) || (!snapshot.hasData))
            // ignore: curly_braces_in_flow_control_structures
            return Container(
                height: 60, child: const SquareSkeleton(height: 40));
          List<MagicEdenNftActivities>? solanaTx = snapshot.data;
          return SingleChildScrollView(
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
                      solanaTx!.length,
                      (index) => TableCell(solanaTx: solanaTx[index]),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
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
        DataCell(
          Text(solanaTx.type.toString(),
              style: solanaTx.type.toString() == 'list'
                  ? const TextStyle(color: AppColors.dPrimaryColor)
                  : solanaTx.type.toString() == 'cancelBid'
                      ? const TextStyle(color: Colors.red)
                      : solanaTx.type.toString() == 'bid'
                          ? const TextStyle(color: Colors.yellow)
                          : const TextStyle(color: Colors.yellow)),
        ),
        DataCell(Text(
            '${solanaTx.tokenMint.toString().substring(0, 4)}...${solanaTx.tokenMint.toString().substring(solanaTx.tokenMint.toString().length - 4, solanaTx.tokenMint.toString().length)}')),
        DataCell(Text(
            '${solanaTx.buyer.toString().substring(0, 4)}...${solanaTx.buyer.toString().substring(solanaTx.buyer.toString().length - 4, solanaTx.buyer.toString().length)}')),
        DataCell(Text(
            '${solanaTx.price != null ? solanaTx.price.toString() : 0} SOL')),
        DataCell(Text(solanaTx.blockTime.toString())),
        DataCell(OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            primary: AppColors.dPrimaryColor.withOpacity(0.6),
            side: BorderSide(
                color: AppColors.dPrimaryColor.withOpacity(0.6), width: 1),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
}
