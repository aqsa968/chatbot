import 'package:chatbot/helper/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetItemRow extends StatelessWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback? onTap;

  const BottomSheetItemRow({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 8, bottom: 8),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: context.isDarkMode
                      ? ThemeColors.dark3
                      : ThemeColors.brown2,
                ),
              ),
              child: Icon(
                icon,
                size: 20,
                color:
                context.isDarkMode ? ThemeColors.dark3 : ThemeColors.brown2,
              ),
            ),
            SizedBox(width: 13),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetItemColumn extends StatelessWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback? onTap;
  final double iconSize;

  const BottomSheetItemColumn({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
    this.iconSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.8,
                    color: context.isDarkMode
                        ? ThemeColors.dark3
                        : ThemeColors.brown2,
                  ),
                ),
                child: Icon(
                  icon,
                  size: iconSize,
                  color:
                  context.isDarkMode ? ThemeColors.dark3 : ThemeColors.brown2,
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
