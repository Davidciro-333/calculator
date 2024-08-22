import 'package:calculator/app/logic_operational/calculator_model.dart';
import 'package:calculator/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonOperation extends StatelessWidget {
  const ButtonOperation({super.key, required this.showIcon, required this.icon, required this.text, this.fontSizeButton, this.backColor, this.onPressed});
  final bool showIcon;
  final IconData icon;
  final String text;
  final double? fontSizeButton;
  final Color? backColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      //color: backColor ?? textColor.withOpacity(0.10),
      width: screenWidth * 0.19,
      height: (screenHeight * 0.08),
      decoration: BoxDecoration(
        color: backColor ?? textColor.withOpacity(0.10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        highlightColor: Colors.blueGrey,
        alignment: Alignment.center,
        onPressed: onPressed,
        icon: showIcon ? Icon(
          icon,
          color: textColor,
          weight: 60,
          size: 30,
        ) : Text(
        text,
        style: TextStyle(
            fontSize: fontSizeButton ?? 22,
            fontWeight: FontWeight.w800,
            color: textColor
        ),
      ),
    ),
    );
  }
}
/*IconButton(
        alignment: Alignment.center,
        onPressed: () {},
        icon: Icon(
          Icons.add_circle,
          color: textColor,
        ),
      ),*/