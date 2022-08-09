import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense tracker',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
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
  int _counter = 0;
  
  
final List<Transaction> transactions=[
    Transaction(id:'1', title:'Dawa shop', amount:12.12, date:DateTime.now()),
    Transaction(id:'2', title:"Weekly shop", amount:22.21, date:DateTime.now()),
  ];
  
  // String? titleInput;
  // String? amountInput;

  final titleController= TextEditingController();
  final amountController=TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

 

 
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
       
        title: Text('Expense tracker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget>[
             Container(
               width:double.infinity,
               child: const Card(
                 color:Colors.blue,
                  child: Text("CHART!"),
                elevation:5,
              ),
             ),
             Card(
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
                         print(titleController.text)
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
             ),
             Column(
               
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
                            '\$' +tx.amount.toString(),
                            style:TextStyle(
                            fontWeight:FontWeight.bold,
                            fontSize:20,
                            color:Colors.purple,
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
             )
          ]
        ),
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
