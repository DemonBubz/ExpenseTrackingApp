import 'package:expense_tracker/models/recentTxForChart.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './chartRender.dart';
import 'package:intl/intl.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction> allTransaction;

//  double weekSpending;
  ChartWidget(this.allTransaction);

  List<RecentTransaction> get listOfRecentTx {
    final List<RecentTransaction> recentTransaction = [];
    for (int i = 0; i < allTransaction.length; i++) {
      if (allTransaction[i]
          .date
          .isAfter(DateTime.now().subtract(Duration(days: 7)))) {
        recentTransaction.add(new RecentTransaction(
            date: allTransaction[i].date, amount: allTransaction[i].amount));
      }
    }
    return recentTransaction;
  }

  List<RecentTransaction> get groupedTransaction {
    final List<RecentTransaction> groupedRecentTransaction = [];
    for (int i = 0; i < 7; i++) {
      double totalMoneyDay = 0.00;
      final weekDay = DateTime.now().subtract(Duration(days: i));
      for (int j = 0; j < listOfRecentTx.length; j++) {
        if (listOfRecentTx[j].date.day == weekDay.day &&
            listOfRecentTx[j].date.month == weekDay.month &&
            listOfRecentTx[j].date.year == weekDay.year) {
          totalMoneyDay += listOfRecentTx[j].amount;
        }
      }
      groupedRecentTransaction
          .add(new RecentTransaction(date: weekDay, amount: totalMoneyDay));
    }
    return groupedRecentTransaction.reversed.toList();
  }

  double calcSum() {
    double weekSum = 0.0;
    for (int i = 0; i < groupedTransaction.length; i++) {
      weekSum += groupedTransaction[i].amount;
    }
    return weekSum;
  }

  Widget build(BuildContext context) {
    return Card(
      margin:EdgeInsets.all(4),
      elevation: 6,
      child: Container(
          padding:EdgeInsets.all(3),
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ...groupedTransaction.map((data) {
            return Flexible(
              fit:FlexFit.tight,
              child: ChartRender(
                amount: data.amount,
                dateAbbr: DateFormat.E().format(data.date).substring(0, 1),
                percentageBar:calcSum()==0?0.00:(data.amount/calcSum()),
              ),
            );
          }).toList(),
        ],
      )),
    );
  }
}
