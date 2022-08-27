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
                ): ListView(
                     children:transactions.map((tx){
                       return Card(
                        //  elevation:3,
                         child:Row(
                           children: [
                             Container(
                               padding:EdgeInsets.all(10),
                               
                               margin: EdgeInsets.symmetric(vertical:10, horizontal:15),
                               decoration:BoxDecoration(border: Border.all(color:Colors.purple, width:2)),
                               child:Text(
                                  '\$' +tx.amount.toStringAsFixed(2),
                                  style:TextStyle(
                                  fontWeight:FontWeight.bold,
                                  fontSize:20,
                                  color:Colors.red,
                                  )
                               )
                             ),
                             Column(
                               crossAxisAlignment:CrossAxisAlignment.start,
                               children:<Widget>[
                                 Text(tx.title, style:TextStyle(
                                   fontWeight:FontWeight.bold,
                                   fontSize:16,
                                   )),
                                 Text(DateFormat.yMMMd().format(tx.date), style:TextStyle(
                                   color:Colors.grey,
                                   fontSize:13
                                 ))
                               ]
                             )
                           ],
                         ),
                       );
                     }).toList(),
                   ),
              
            );
  }
}