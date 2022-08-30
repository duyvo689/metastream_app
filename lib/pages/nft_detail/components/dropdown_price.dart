import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';

class DropdownPrice extends StatefulWidget {
  const DropdownPrice({Key? key}) : super(key: key);

  @override
  State<DropdownPrice> createState() => _DropdownPriceState();
}

class _DropdownPriceState extends State<DropdownPrice> {
  String dropdownValue = 'Pay in SOL';

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.bgrMainColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(
            Icons.expand_more,
          ),
          elevation: 16,
          style: const TextStyle(
            color: Colors.deepPurple,
          ),
          dropdownColor: AppColors.bgrMainColor,
          underline: Container(),
          isExpanded: true,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Pay in SOL', 'Pay in ETH', 'Pay in BSC']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  const Icon(
                    Icons.paid,
                    color: Colors.deepPurple,
                    size: 24,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.textPrimaryColor),
                      ),
                      const Text(
                        'Pay with connected wallet',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.textSecondColor),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
