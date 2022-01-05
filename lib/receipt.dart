import 'package:flutter/material.dart';

class Receipt extends StatefulWidget {


  @override
  _ReceiptState createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    backgroundColor: Colors.yellow[800],
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        'Payment',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
      body: Container(
        width: MediaQuery.of(context).size.width * 9,
        child: Column(
          children: [
            Text ('AZY00106'),
            Text ('Demo'),
            Divider(
                color: Colors.black
            )

          ],
        ),

      ),
    );
  }
}
