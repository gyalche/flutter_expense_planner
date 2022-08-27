import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
   
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
//  NewTransaction({Key? key}) : super(key: key);
  final titleController= TextEditingController();
  final amountController=TextEditingController();

   void submitData() {
    final enteredTitle=titleController.text;
    final enteredAmount=double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount<=0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
               child:Container(
                 margin:EdgeInsets.all(10),
                 
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     TextField(
                      decoration:InputDecoration(labelText:'Title'),
                        controller:titleController,
                        onSubmitted:(_)=>submitData(),
                      ),
                     
                     TextField(
                       decoration:InputDecoration(
                         labelText:"Amount",),
                       controller:amountController,
                       keyboardType:TextInputType.number,
                       onSubmitted:(_) =>submitData(),
                      
                     ),
      
                     TextButton(
                       onPressed: submitData,
                        child: Text("Add Transaction", style:TextStyle(
                          color:Colors.purple,
                        )),
                        style:TextButton.styleFrom(primary:Colors.blue,
                          // padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                        )
      
                        
                    )
                   ],
                 ),
               )
             );
  }
}