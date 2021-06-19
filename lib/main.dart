import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    new Transaction(
        id: 't1', title: "New Shoes", amount: 70.00, date: DateTime.now()),
    new Transaction(
        id: 't2', title: "Groceries", amount: 15.00, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Card(
            child: Container(
              child: Text("Our Chart will later go here"),
              width: double.infinity,
            ),
            elevation: 5,
            color: Colors.blue,
          ),
          Column(
            children: <Widget>[
              ...transactions.map((transactionObject) {
                return Card(
                  child: Row(children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text(
                        // "Rs" + transactionObject.amount.toString(), this is concatenation, use interpolation
                        "Rs ${transactionObject.amount}", //this is interpolation dollar sign used for concatenation
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
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactionObject.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(DateFormat("MMM d, yyyy").format(transactionObject.date),
                              style: TextStyle(color: Colors.grey)),
                        ]),
                  ]),
                );
              }).toList(),
            ],
          ),
        ],
      ),
    );
  }
}
