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
    return LayoutBuilder(
      builder:(context,constraints){
        return Column(
      children: <Widget>[
        Container(
          height: constraints.maxHeight*0.12,
                  child: FittedBox(
            
            child: Text("Rs ${amount.toStringAsFixed(0)}",style:TextStyle(fontSize: 12)),
          ),
        ),
        SizedBox(height: constraints.maxHeight*0.05),
        Container(
          height: constraints.maxHeight*0.6,
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
        SizedBox(height:constraints.maxHeight*0.05),
        Container(
          height: constraints.maxHeight*0.15,
          child: Text(dateAbbr),
        ),
      ],
    );
      },
    ); 
    
    
  }
}
