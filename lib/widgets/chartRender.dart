import 'package:flutter/material.dart';

class ChartRender extends StatelessWidget {
  final double amount;
  final String dateAbbr;
  final double percentageBar;
  ChartRender(
      {required this.amount,
      required this.dateAbbr,
      required this.percentageBar});
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text("Rs ${amount.toStringAsFixed(0)}"),
        ),
        SizedBox(height: 4),
        Container(
          height: 90,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor:percentageBar ,
                child:Container(
                  decoration: BoxDecoration(
                    color:Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Container(
          child: Text(dateAbbr),
        ),
      ],
    );
  }
}
