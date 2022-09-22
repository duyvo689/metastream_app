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
        color: AppColors.bgrCardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: FutureBuilder<List<SolanaTx>>(
        future: ApiSolanaTxServices().fetchSolanaTx(mintAddress),
        builder: (context, snapshot) {
          if ((snapshot.hasError) || (!snapshot.hasData))
            // ignore: curly_braces_in_flow_control_structures
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
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'TYPE',
                        style: TextStyle(color: AppColors.textSecondColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'TRANSACTION',
                        style: TextStyle(color: AppColors.textSecondColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'SELLER',
                        style: TextStyle(color: AppColors.textSecondColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'BUYER',
                        style: TextStyle(color: AppColors.textSecondColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'PRICE',
                        style: TextStyle(color: AppColors.textSecondColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'TIME',
                        style: TextStyle(color: AppColors.textSecondColor),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'ACTIONS',
                        style: TextStyle(color: AppColors.textSecondColor),
                      ),
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

  DataRow TableCell({required SolanaTx solanaTx}) {
    return DataRow(
      cells: <DataCell>[
        DataCell(
          Text(solanaTx.type.toString(),
              style: solanaTx.type.toString() == 'Listing'
                  ? TextStyle(color: AppColors.primaryColor.withOpacity(0.6))
                  : solanaTx.type.toString() == 'Cancel'
                      ? const TextStyle(color: Colors.red)
                      : const TextStyle(color: AppColors.textPrimaryColor)),
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
            primary: AppColors.primaryColor.withOpacity(0.6),
            side: BorderSide(
                color: AppColors.primaryColor.withOpacity(0.6), width: 1),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          label: const Text(
            'VIEW',
            style: TextStyle(fontSize: 14),
          ),
          icon: const Icon(
            Icons.open_in_new_outlined,
            size: 18,
          ),
          onPressed: () {
            // Respond to button press
          },
        )),
      ],
    );
  }
}
