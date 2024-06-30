import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomMoney extends StatelessWidget {
  const CustomMoney({
    super.key,
    required this.amount,
    required this.textStyle,
  });
  final double amount;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final formater = NumberFormat.currency(
      locale: 'eu',
      customPattern: '#,### \u00a4',
      symbol: '',
      decimalDigits: 2,
    );
    final String convertMoneyString = formater.format(amount);
    final splitConvertedValue = convertMoneyString.split(',');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Text('\$',
              style: textStyle.copyWith(
                  fontSize: textTheme.displaySmall!
                      .fontSize) //textTheme.displaySmall!.copyWith(color: Colors.white),
              ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: splitConvertedValue[0],
                style: textStyle,
              ),
              TextSpan(
                  text: ',${splitConvertedValue[1]}',
                  style: textStyle.copyWith(
                      fontSize: textTheme.bodyLarge!.fontSize)),
            ],
          ),
        ),
      ],
    );
  }
}
