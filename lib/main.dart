import './widgets/transactionListCard.dart';
import 'package:flutter/material.dart';
import 'widgets/textFieldCard.dart';
import 'models/transaction.dart';
import 'widgets/chartWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      title: "My expense Tracker",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.greenAccent,
        scaffoldBackgroundColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 19,
                fontFamily: "Lato",
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  // String titleInput="";
  // String amountInput="";
  //alternative
  final List<Transaction> _transactions = [];

  void addTransaction({title, amount, date}) {
    setState(() {
      _transactions.add(new Transaction(
          amount: amount,
          title: title,
          id: DateTime.now().millisecond,
          date: date));
    });
  }

  void removeTransaction(int id) {
    setState(() {
      _transactions.removeWhere((items) {
        return items.id == id;
      });
    });
  }

  void bringSheetUp(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (BuildContext bContext) {
          return TextFieldCard(addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              bringSheetUp(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(4),
              child: Container(
                child: ChartWidget(_transactions),
                width: double.infinity,
              ),
              elevation: 5,
              color: Theme.of(context).primaryColor,
            ),
            TransactionListCard(_transactions,removeTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          bringSheetUp(context);
        },
      ),
    );
  }
}
