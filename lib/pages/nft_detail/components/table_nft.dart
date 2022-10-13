// ignore_for_file:  curly_braces_in_flow_control_structures

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class TableNFT extends StatelessWidget {
  const TableNFT({Key? key, required this.mintAddress}) : super(key: key);
  final String mintAddress;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.dGreyDarkColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: FutureBuilder<List<SolanaTx>>(
        future: ApiSolanaTxServices().fetchSolanaTx(mintAddress),
        builder: (context, snapshot) {
          if ((snapshot.hasError) || (!snapshot.hasData))
            return Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => const CardSkeleton(),
              ),
            );
          List<SolanaTx>? solanaTx = snapshot.data;
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
                      label: _TextHeaderDataColumn(name: 'TRANSACTION'),
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

  DataRow TableCell({required SolanaTx solanaTx}) {
    return DataRow(
      cells: <DataCell>[
        DataCell(
          Text(solanaTx.type.toString(),
              style: solanaTx.type.toString() == 'Listing'
                  ? TextStyle(color: AppColors.dPrimaryColor.withOpacity(0.6))
                  : solanaTx.type.toString() == 'Cancel'
                      ? const TextStyle(color: Colors.red)
                      : const TextStyle(color: Colors.white)),
        ),
        DataCell(Text(
            '${solanaTx.transaction.toString().substring(0, 4)}...${solanaTx.transaction.toString().substring(solanaTx.transaction.toString().length - 4, solanaTx.transaction.toString().length)}')),
        DataCell(Text(
            '${solanaTx.mintAddress.toString().substring(0, 4)}...${solanaTx.mintAddress.toString().substring(solanaTx.mintAddress.toString().length - 4, solanaTx.mintAddress.toString().length)}')),
        const DataCell(Text('...')),
        DataCell(Text(
            '${solanaTx.price != null ? solanaTx.price.toString() : 0} SOL')),
        DataCell(Text(solanaTx.createdAt.toString())),
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
