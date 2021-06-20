import 'package:flutter/material.dart';
import './textFieldCard.dart';
import './transactionListCard.dart';
import '../models/transaction.dart';

class TransactionDisplay extends StatefulWidget{
  State<StatefulWidget> createState(){
    return _TransactionDisplayState();
  }
}

class _TransactionDisplayState extends State<TransactionDisplay>{
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();
    final List<Transaction> _transactions = [
    new Transaction(
        id: 't1', title: "New Shoes", amount: 70.00, date: DateTime.now()),
    new Transaction(
        id: 't2', title: "Groceries", amount: 15.00, date: DateTime.now()),
  ];
  void addTransaction({title, amount}){
    setState((){
   _transactions.add(new Transaction(amount:amount, title:title , id:" ",date:DateTime.now() ));
    });
    print(_transactions);
  }

  Widget build(BuildContext context){
    return Column(
      children:<Widget>[
        TextFieldCard(addTransaction),//widget contains text fields for inputs
        TransactionListCard(_transactions),//widget contains list of transactions mapped in form of widgets using .map()
      ],
    );
  }
}