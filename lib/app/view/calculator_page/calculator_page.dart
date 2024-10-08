import 'dart:ui';
import 'package:calculator/app/logic_operational/calculator_model.dart';
import 'package:calculator/app/utils/colors.dart';
import 'package:calculator/app/view/components/button_operation.dart';
import 'package:calculator/app/view/components/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///final screenSize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle('Calculator'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Image.asset(
                'assets/images/back-image.png',
                width: screenWidth,
                height: screenHeight,
              )),
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                ///mainAxisAlignment: MainAxisAlignment.,
                children: [
                  //const CalculatorTitle(),
                  ResultArea(screenHeight: screenHeight),
                  OperationArea(screenHeight: screenHeight)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorTitle extends StatelessWidget {
  const CalculatorTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextTitle('Calculator'),
      ],
    );
  }
}

class ResultArea extends StatelessWidget {
  const ResultArea({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorModel>(context);

    return Expanded(
      child: Container(
          width: double.maxFinite,
          //height: screenHeight * 0.32,
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(calculator.display,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.dark_mode,
                          color: textColor,
                        )),
                    Text(calculator.display,
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class OperationArea extends StatelessWidget {
  const OperationArea({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        color: primaryColor.withOpacity(0.8),
      ),
      width: double.maxFinite,
      //height: screenHeight * 0.68,
      alignment: Alignment.center,
      child: const Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            LineOne(),
            Padding(padding: EdgeInsets.only(top: 10)),
            LineTwo(),
            Padding(padding: EdgeInsets.only(top: 10)),
            LineThree(),
            Padding(padding: EdgeInsets.only(top: 10)),
            LineFour(),
            Padding(padding: EdgeInsets.only(top: 10)),
            LineFive(),
          ],
        ),
      ),
    );
  }
}

class LineOne extends StatelessWidget {
  const LineOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonOperation(onPressed: () => calculator.clear(),showIcon: false, icon: Icons.clear, text: 'AC'),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(onPressed: () => calculator.backspace(),
            showIcon: true, icon: Icons.backspace_rounded, text: ''),
        const Padding(padding: EdgeInsets.only(right: 0)),
        const ButtonOperation(showIcon: true, icon: Icons.percent, text: ''),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(onPressed: () => calculator.setOperation('/'), showIcon: true, icon: CupertinoIcons.divide, text: '÷'),
      ],
    );
  }
}

class LineTwo extends StatelessWidget {
  const LineTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonOperation(onPressed: () => calculator.inputDigit('7') ,showIcon: false, icon: Icons.clear, text: '7'),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(onPressed: () => calculator.inputDigit('8') ,showIcon: false, icon: Icons.clear, text: '8'),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(onPressed: () => calculator.inputDigit('9') ,showIcon: false, icon: Icons.clear, text: '9'),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(onPressed: () => calculator.setOperation('*'), showIcon: true, icon: Icons.clear, text: 'AC'),
      ],
    );
  }
}

class LineThree extends StatelessWidget {
  const LineThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonOperation(onPressed: () => calculator.inputDigit('4') ,showIcon: false, icon: Icons.clear, text: '4'),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(onPressed: () => calculator.inputDigit('5'), showIcon: false, icon: Icons.clear, text: '5'),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(onPressed: () => calculator.inputDigit('3'), showIcon: false, icon: Icons.clear, text: '6'),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(
            onPressed: () => calculator.setOperation('-') ,
            showIcon: false, icon: Icons.minimize_rounded, text: '-'),
      ],
    );
  }
}

class LineFour extends StatelessWidget {
  const LineFour({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonOperation(onPressed: () => calculator.inputDigit('1'), showIcon: false, icon: Icons.clear, text: '1'),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(onPressed: () => calculator.inputDigit('2'), showIcon: false, icon: Icons.clear, text: '2'),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(onPressed: () => calculator.inputDigit('3'), showIcon: false, icon: Icons.clear, text: '3'),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(onPressed: () => calculator.setOperation('+'), showIcon: true, icon: Icons.add, text: '+'),
      ],
    );
  }
}

class LineFive extends StatelessWidget {
  const LineFive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ButtonOperation(showIcon: true, icon: Icons.history, text: '1'),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(onPressed: () => calculator.inputDigit('0'), showIcon: false, icon: Icons.clear, text: '0'),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(onPressed: () => calculator.inputDot(), showIcon: false, icon: Icons.clear, text: '.'),
        const Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(
          onPressed: () => calculator.calculate(),
          showIcon: false,
          icon: CupertinoIcons.equal,
          text: '=',
          backColor: Colors.green,
        ),
      ],
    );
  }
}