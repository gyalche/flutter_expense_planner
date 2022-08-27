import 'package:expense_track/widgets/chart.dart';
import 'package:expense_track/widgets/new_transaction.dart';
import 'package:expense_track/widgets/transactionList.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        
        // fontFamily:'Quicksand'
      ),
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 final List<Transaction> _userTransaction=[
    // Transaction(id:'1', title:'Dawa shop', amount:12.12, date:DateTime.now()),
    // Transaction(id:'2', title:"Weekly shop", amount:22.21, date:DateTime.now()),
    // Transaction(id:'3', title:"monthly shop", amount:52.21, date:DateTime.now()),

  ];
   List<Transaction>get _recentTransaction{
    // var _userTransactions;
    return _userTransaction.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days:7)));
    }).toList();
  }

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

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return NewTransaction(_addNewTransaction);
    });
  }
 
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.purple,
          title: Text('Expense tracker'),
          actions: [
            IconButton(icon:Icon(Icons.add),
              onPressed:() => _startAddNewTransaction(context)
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:<Widget>[
                 Chart(_recentTransaction),
                TransactionList(_userTransaction)
               

              ]
            ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.purple,
          child:Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context)
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
