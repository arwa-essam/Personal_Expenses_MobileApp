import 'package:app_2/widgets/charbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class chart extends StatelessWidget{

final List recenttransactions;
chart(this.recenttransactions);
 
 List get groupedtransactionsvalues{
  return List.generate(7, (index){
   final weekday=DateTime.now().subtract(Duration(days: index));
  

  var totalsum=0.0;
  for(var i=0; i<recenttransactions.length; i++){
    if(recenttransactions[i].date.day==weekday.day&&
       recenttransactions[i].date.month==weekday.month&&
       recenttransactions[i].date.year==weekday.year){
         totalsum+=recenttransactions[i].amount;
       }
  }
  return {'day':DateFormat.E().format(weekday).substring(0,1),
           'amount':totalsum};
  }).reversed.toList();
 }

double get totalspending{
  return groupedtransactionsvalues.fold(0.0, (sum, item){
     return sum+item['amount'];
  });
}
Widget build(BuildContext context){
 return Card(
   elevation: 6,
   margin: EdgeInsets.all(20),
   child: Padding(padding:EdgeInsets.all(10),
       child: Row(
    mainAxisAlignment:MainAxisAlignment.spaceAround,
       children: groupedtransactionsvalues.map((data){
         return Flexible(
           fit:FlexFit.tight,
           child: chartbar(data['day'], data['amount'], 
           totalspending==0.0? 0.0: (data['amount'] as double)/totalspending),
         );

       }).toList(),

        ),),
          );

}





}