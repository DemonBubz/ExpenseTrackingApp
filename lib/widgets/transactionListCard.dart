import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListCard extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function removeTransaction;
  TransactionListCard(this._transactions, this.removeTransaction);

  Widget build(BuildContext context) {
    return Container(
      child: _transactions.isEmpty
          ? LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                // margin: EdgeInsets.only(top: 30),
                height:constraints.maxHeight*0.6,
                child:
                    Image.asset("assets/images/stock.png", fit: BoxFit.contain),
              );
            })
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (BuildContext context, int index) {
                print(index);
                return Card(
                  child: ListTile(
                    leading: Container(
                      width: 84,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                            child: Text("Rs ${_transactions[index].amount}")),
                      ),
                    ),
                    title: Text(
                      _transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(
                        _transactions[index].date,
                      ),
                      style: TextStyle(fontSize: 12),
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          removeTransaction(_transactions[index].id);
                        }),
                  ),
                );
              },
            ),
    );
  }
}
