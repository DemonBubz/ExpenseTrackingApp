import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListCard extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function removeTransaction;
  TransactionListCard(this._transactions,this.removeTransaction);

  Widget build(BuildContext context) {
    return Container(
      height: 380,
      child: _transactions.isEmpty
          ? Container(
              margin: EdgeInsets.only(top: 100),
              child: Image.asset("assets/images/stock.png", fit: BoxFit.cover),
            )
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (BuildContext context, int index) {
                print(index);
                return Card(
                  elevation:4,
                  margin:EdgeInsets.symmetric(vertical:3,horizontal:5),
                  child: Row(children: <Widget>[
                    Container(
                      width:100,
                      padding: EdgeInsets.all(10),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: FittedBox(
                        child: Text(
                          // "Rs" + transactionObject.amount.toString(), this is concatenation, use interpolation
                          "Rs ${_transactions[index].amount.toStringAsFixed(2)}", //this is interpolation dollar sign used for concatenation
                          style: Theme.of(context).textTheme.headline6,
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
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _transactions[index].title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                                DateFormat("MMM d, yyyy")
                                    .format(_transactions[index].date),
                                style: TextStyle(color: Colors.grey)),
                          ]),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {removeTransaction(_transactions[index].id);},
                    )
                  ]),
                );
              },
            ),
    );
  }
}
