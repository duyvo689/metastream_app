import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  static void show(
    context,
    String heading,
    String subHeading,
    String positiveButtonText,
    Function onPressedPositive, {
    required String negativeButtonText,
    required Function onPressedNegative,
    bool showNegativeButton = true,
    bool isPositiveButtonDangerous = false,
  }) {
    if (Platform.isIOS) {
      // iOS-specific code
      showCupertinoDialog(
        context: context,
        useRootNavigator: false,
        builder: (_) => CupertinoAlertDialog(
          title: _buildTitle(context, heading),
          content: _buildSubTitle(context, subHeading),
          actions: _buildActions(
            context,
            positiveButtonText,
            onPressedPositive,
            negativeButtonText,
            onPressedNegative,
            showNegativeButton,
            isPositiveButtonDangerous,
          ),
        ),
      );
    } else {
      showDialog(
        useRootNavigator: false,
        context: context,
        builder: (_) => AlertDialog(
          title: _buildTitle(context, heading),
          content: _buildSubTitle(context, subHeading),
          actions: _buildActions(
            context,
            positiveButtonText,
            onPressedPositive,
            negativeButtonText,
            onPressedNegative,
            showNegativeButton,
            isPositiveButtonDangerous,
          ),
        ),
      );
    }
  }

  static _buildTitle(context, String heading) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(heading, style: const TextStyle(fontSize: 18)),
    );
  }

  static _buildSubTitle(context, String subHeading) {
    if (subHeading != null && subHeading.isNotEmpty) {
      return Text(
        subHeading,
        style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
      );
    }
    return const SizedBox.shrink();
  }

  static List<Widget> _buildActions(
      context,
      String positiveButtonText,
      Function onPressedPositive,
      String negativeButtonText,
      Function onPressedNegative,
      bool showNegativeButton,
      bool isPositiveButtonDangerous) {
    return [
      if (showNegativeButton)
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              primary: Colors.transparent,
              onPrimary: Colors.transparent,
              textStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          onPressed: () {
            if (onPressedNegative != null) {
              onPressedNegative();
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(
            negativeButtonText ?? 'Cancel',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isPositiveButtonDangerous ? Colors.black : Colors.red),
          ),
        ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            primary: Colors.transparent,
            onPrimary: Colors.transparent,
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        onPressed: () {
          onPressedPositive();
        },
        child: Text(
          positiveButtonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isPositiveButtonDangerous ? Colors.red : Colors.black,
          ),
        ),
      ),
    ];
  }
}
