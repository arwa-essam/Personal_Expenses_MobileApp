
import 'package:app_2/widgets/new_teansaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
class transactionlist extends StatelessWidget{
final List transactions;
final deletetx;
transactionlist(this.transactions,this.deletetx);

 

Widget build(BuildContext context){
return Container(
  height:450,
  child:transactions.isEmpty?Column(children:[Text('N0 transactions added yey!',
  style: TextStyle(color: Colors.purple,fontSize:24,fontWeight: FontWeight.w700)
  ),SizedBox(height:20)] )
    :ListView.builder(
    itemCount: transactions.length,
    itemBuilder: (cxt, index){
       return Card(
         elevation: 6,
         margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
         child:ListTile(leading: 
         CircleAvatar(radius: 30,
         child:Padding(padding:EdgeInsets.all(6),
            child:FittedBox(
                child:Text('\$${transactions[index].amount}'),),
           ),),
           title: Text(transactions[index].title,),
           subtitle: Text(DateFormat.yMMMd().format(transactions[index].date),
           ),
           trailing: IconButton(
             onPressed: (){deletetx(transactions[index].id);},
             icon: Icon(Icons.delete,
             color: Theme.of(context).primaryColor,
             )
           ),
           ),
       );
           },

        )
    
  );
}
//);


}


