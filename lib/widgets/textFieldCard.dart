import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldCard extends StatefulWidget {
  final Function addTransaction;
  TextFieldCard(this.addTransaction);
  State<StatefulWidget> createState() {
    return TextFieldCardState(addTransaction);
  }
}

class TextFieldCardState extends State<TextFieldCard> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransactionPassedDown;
  DateTime _pickedDate = DateTime.now();
  var choosen = false;
  TextFieldCardState(this.addTransactionPassedDown);

  void addTransactionCaller() {
    String title = titleController.text;
    double amount = double.parse(amountController.text);
    if (amountController.text.isEmpty || titleController.text.isEmpty) {
      return;
    }

    if (title.isEmpty || amount <= 0 || choosen == false) {
      return;
    }
    addTransactionPassedDown(title: title, amount: amount, date: _pickedDate);
    Navigator.of(context).pop();
  }

  void bringCalendar() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime.now())
        .then((selectedDate) {
      if (selectedDate == null) {
        return;
      }
      setState(() {
        choosen = true;
        _pickedDate = selectedDate;
      });
    });
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom +20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                // onChanged: (String inputValue) {
                //   titleInput=inputValue;
                // }
                //alternative of onChanged
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                // onChanged: (String inputValue){
                //   amountInput=inputValue;
                // }

                //alternative of onChanged
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) {
                  addTransactionCaller();
                },
              ),
              Container(
                height: 70,
                child: Row(children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(choosen
                        ? "Choosen Date: ${DateFormat.yMd().format(_pickedDate)}"
                        : "No Date Picked!"),
                  ),
                  TextButton(
                      child: Text(
                        "choose date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: bringCalendar),
                ]),
              ),
              RaisedButton(
                child: Text("Add new Entry"),
                onPressed: () {
                  addTransactionCaller();
                },
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button?.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
