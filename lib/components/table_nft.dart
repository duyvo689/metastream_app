import 'package:flutter/material.dart';

import '../values/app_colors.dart';
import '../values/app_size.dart';

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
                    style: TextStyle(color: AppColors.textSecondColor),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'TRANSACTION ID',
                    style: TextStyle(color: AppColors.textSecondColor),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'TRANSACTION TYPE',
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
                    DataCell(Text('4 minutes ago',
                        style: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.6)))),
                    DataCell(OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        primary: AppColors.primaryColor.withOpacity(0.6),
                        side: BorderSide(
                            color: AppColors.primaryColor.withOpacity(0.6),
                            width: 1),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
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
                ),
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
                                  image: AssetImage('assets/images/nft3.png'),
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
                    DataCell(Text('4 minutes ago',
                        style: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.6)))),
                    DataCell(OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        primary: AppColors.primaryColor.withOpacity(0.6),
                        side: BorderSide(
                            color: AppColors.primaryColor.withOpacity(0.6),
                            width: 1),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
