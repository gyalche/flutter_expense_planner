import 'package:expense_track/models/transaction.dart';
import 'package:expense_track/widgets/new_transaction.dart';
import 'package:expense_track/widgets/transactionList.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
   final List<Transaction> _userTransaction=[
    Transaction(id:'1', title:'Dawa shop', amount:12.12, date:DateTime.now()),
    Transaction(id:'2', title:"Weekly shop", amount:22.21, date:DateTime.now()),
    Transaction(id:'3', title:"monthly shop", amount:52.21, date:DateTime.now()),

  ];

  void _addNewTransaction(String title, double amount){
    final newTx=Transaction(
      title:title,
      amount:amount,
      date:DateTime.now(), 
      id:DateTime.now().toString());

       setState((){
        _userTransaction.add(newTx);
      });
  }

 
  @override
  Widget build(BuildContext context) {
    return 
       Column(
            
            children:<Widget>[
               
               NewTransaction(_addNewTransaction),
               TransactionList(_userTransaction)
            ]
          
    );
  }
}