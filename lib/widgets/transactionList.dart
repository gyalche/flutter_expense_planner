import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  //  TransactionList({Key? key}) : super(key: key);

  final List<Transaction>transactions;

  TransactionList( this.transactions);
  
 
  @override
  Widget build(BuildContext context) {
    return 
            Container(
              height:440,
                child: transactions.isEmpty? Column(
                  children: [
                    Text('No transaction added yet'),
                    SizedBox(height:10),
                    Image.asset("assets/images/myprofile.png", fit:BoxFit.cover)
                  ]
                ): ListView.builder(itemBuilder: (ctx, index){
                  
                    return Card(
                      elevation:5,
                      margin:EdgeInsets.symmetric(vertical:8, horizontal:5),
                      child: ListTile(leading:CircleAvatar(radius:30, child:Padding(
                        padding: const EdgeInsets.all(10),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                        )
                      ),
                      title:Text(transactions[index].title),
                      subtitle:Text(DateFormat.yMMMd().format(transactions[index].date))
                    
                      ),
                    );

                }, itemCount:transactions.length)
              
            );
  }
}