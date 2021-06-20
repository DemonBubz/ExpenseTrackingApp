import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListCard extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionListCard(this._transactions);

  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  // "Rs" + transactionObject.amount.toString(), this is concatenation, use interpolation
                  "Rs ${_transactions[index].amount.toStringAsFixed(2)}", //this is interpolation dollar sign used for concatenation
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
                Text(
                  _transactions[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                    DateFormat("MMM d, yyyy").format(_transactions[index].date),
                    style: TextStyle(color: Colors.grey)),
              ]),
            ]),
          );
        },
      ),
    );
  }
}
