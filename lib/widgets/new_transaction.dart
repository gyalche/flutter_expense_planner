import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
   
//  NewTransaction({Key? key}) : super(key: key);

  final titleController= TextEditingController();
  final amountController=TextEditingController();

  final Function addTx;
  NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
               child:Container(
                 margin:EdgeInsets.all(10),
                 
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     TextField(
                      decoration:InputDecoration(
                        labelText:'Title'),
                        controller:titleController,
                        // onChanged:(val){
                        //   titleInput=val;
                        // }
                      ),
                     
                     TextField(
                       decoration:InputDecoration(
                         labelText:"Amount",
                         
                       ),
                       controller:amountController,
                      //  onChanged:(val){
                      //    amountInput=val;
                      //  }
                     ),
      
                     TextButton(
                       onPressed: (() => {
                         addTx(titleController.text,double.parse(amountController.text) )
                       }),
                        child: Text("Add Transaction", style:TextStyle(
                          color:Colors.purple
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