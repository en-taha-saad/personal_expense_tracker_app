import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: 'title',
              ),
              controller: titleController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: 'amount',
              ),
              controller: amountController,
            ),
            FlatButton(
              onPressed: submitData,
              child: Text(
                'Add transaction',
              ),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
