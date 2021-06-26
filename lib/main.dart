import './widgets/transactionListCard.dart';
import 'package:flutter/material.dart';
import 'widgets/textFieldCard.dart';
import 'models/transaction.dart';
import 'widgets/chartWidget.dart';
import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      title: "My expense Tracker",
      theme: ThemeData(
        primarySwatch: Colors.teal,
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
  var showChartLandscape=false;

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
        },
        isScrollControlled: true,
        );
  }

  
  @override
  Widget build(BuildContext context) {
    var orientation=MediaQuery.of(context).orientation;
    var appBar = AppBar(
      title: Text("Expense Tracker"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            bringSheetUp(context);
          },
        ),
      ],
    );

    var chartWidgetCode=Card(
            margin: EdgeInsets.all(4),
            child: Container(
              child: ChartWidget(_transactions),
              width: double.infinity,
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.24,
            ),
            elevation: 5,
            color: Theme.of(context).primaryColor,
          );

    var listWidgetCode= Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.71,
              child: TransactionListCard(_transactions, removeTransaction));

    return Scaffold(
      appBar: appBar,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if(orientation==Orientation.landscape)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ShowChart"),
              Switch(
                value: showChartLandscape,
                onChanged: (bool val) {
                  setState((){
                    showChartLandscape=val;
                  });

                },
              ),
            ],
          ),
          if(orientation==Orientation.landscape)
          showChartLandscape?Card(
            margin: EdgeInsets.all(4),
            child: Container(
              child: ChartWidget(_transactions),
              width: double.infinity,
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
            ),
            elevation: 5,
            color: Theme.of(context).primaryColor,
          ):listWidgetCode,
          if(orientation==Orientation.portrait)
          chartWidgetCode,
          if(orientation==Orientation.portrait)
          listWidgetCode,
        ],
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
