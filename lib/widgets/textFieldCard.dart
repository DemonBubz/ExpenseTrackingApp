import 'package:flutter/material.dart';

class TextFieldCard extends StatelessWidget {
 final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;
  TextFieldCard(this.addTransaction);

  void addTransactionCaller(){
    String title=titleController.text;
    double amount=double.parse(amountController.text);
    if(title.isEmpty || amount<=0){
      return;
    }

    addTransaction(title:title, amount:amount);
  }

  Widget build(BuildContext context) {
    return Card(
      elevation:6,
      child: Container(
        padding: EdgeInsets.all(10),
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
              onSubmitted:(_){
                addTransactionCaller();
              },
            ),
            FlatButton(
              child: Text("Add new Entry"),
              onPressed:(){ addTransactionCaller();},
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
