import 'package:flutter/material.dart';
import 'widgets/transactionDisplay.dart';

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
  // String titleInput="";
  // String amountInput="";

  //alternative

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Container(
                child: Text("Our Chart will later go here"),
                width: double.infinity,
              ),
              elevation: 5,
              color: Colors.blue,
            ),
            TransactionDisplay(),
          ],
        ),
      ),
    );
  }
}
