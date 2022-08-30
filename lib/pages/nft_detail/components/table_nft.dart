import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';

class TableNFT extends StatelessWidget {
  const TableNFT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.bgrCardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Name',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'TRANSACTION ID',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'TRANSACTION TYPE',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'TIME',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6),
                                  bottomLeft: Radius.circular(6),
                                  bottomRight: Radius.circular(6),
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/nft1.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text('Double Jump #567'),
                      ],
                    )),
                    const DataCell(Text('4BSvS ... U8E')),
                    const DataCell(Text('Listing')),
                    const DataCell(Text('4')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
