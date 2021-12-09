import 'package:flutter/material.dart';
import 'package:app_2/models/transaction.dart';
import 'package:app_2/widgets/transaction_list.dart';
import 'package:app_2/widgets/new_teansaction.dart';
import 'package:app_2/widgets/chart.dart';
import 'package:app_2/widgets/charbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
Widget build(BuildContext context){
return MaterialApp(
   title: 'Personal Expenses',
   theme:  ThemeData(
     primarySwatch: Colors.purple,
   //  fontFamily: 'Quicksand',
   //  textTheme:ThemeData.light().textTheme.copyWith(
   //    bodyText1: TextStyle(
   //      fontFamily: 'OpenSans',
    //       fontSize: 18,
     //      fontWeight: FontWeight.bold,
     //  )
     ),
   //  appBarTheme: AppBarTheme(
    //   textTheme: ThemeData.light().textTheme.copyWith(
    //        bodyText1:TextStyle(
    //       fontFamily: 'OpenSans',
    //       fontSize: 20,
    //       fontWeight: FontWeight.bold,
      //   )
     //  ),
     //)
  // ),
   home: MyHomePage(),
);

}
}
class MyHomePage extends StatefulWidget{
  _MyHomePageState createState() =>_MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  final List<Transaction> _usertransactions=[];
  List<Transaction> get _recenttransactions{
    return _usertransactions.where((element){
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7),),);
    }).toList();
  }

  void _addnewtransaction(String txtitle,double txamount,var chosendate){
    final newtx =Transaction(
      DateTime.now().toString(),
       txamount,
        chosendate,
        txtitle);
    setState(() {
      _usertransactions.add(newtx);
    });
  }
  void _deletetransaction(String id){
     setState(() {
       _usertransactions.removeWhere((tx) => tx.id==id);
     });
  }

  void _startaddnewtransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx,
    builder: (_){
      return GestureDetector(
         onTap: (){},
         child:newtransaction(_addnewtransaction),
         behavior: HitTestBehavior.opaque,
      );
    },);
  }
   
   Widget build (BuildContext context){
     return Scaffold(
       appBar: AppBar(
         title: Text('personal Expenses'),
         actions: [
           IconButton(
             icon: Icon(Icons.add),
             onPressed:()=>_startaddnewtransaction(context),
           )
         ],
       ),
       body: SingleChildScrollView(
         child:Column(
           mainAxisAlignment:MainAxisAlignment.start,
           crossAxisAlignment:CrossAxisAlignment.stretch,
           children: [
            chart(_recenttransactions),
             transactionlist(_usertransactions,_deletetransaction),

           ],)),
           floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
           floatingActionButton:FloatingActionButton(
            child:Icon(Icons.add),
            onPressed: ()=> _startaddnewtransaction(context)
            ) ,
     );
   }
}
