// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class newtransaction extends StatefulWidget {
  _newtransactionState createState()=>_newtransactionState();
   final addtx;
   newtransaction(this.addtx);
}
class _newtransactionState extends State<newtransaction>{
  final titlecontroller=TextEditingController();
  final amountcontroller=TextEditingController();
  //DateTime subDate;
 var subDate;
  void _submitdata(){
    if(amountcontroller.text.isEmpty){
      return;
    }
    final enteredtitle =titlecontroller.text;
    final enteredamount=double.parse(amountcontroller.text);
    if(enteredtitle.isEmpty||enteredamount<=0 || subDate==null){
      return;
    }
    widget.addtx(enteredtitle,enteredamount,subDate);
    Navigator.of(context).pop();
  }
  void _datapicker (){
   showDatePicker(context: context,
    initialDate:DateTime.now(), 
    firstDate: DateTime(2021),
     lastDate: DateTime.now()).then((chosendate){
       if(chosendate==null){
         return;
       }
       setState(() {
         subDate=chosendate;
       });
     });
   
    print('....');
  }
  

   Widget build (BuildContext context){
     return Card(elevation:5,
     child: Container(
     padding: EdgeInsets.all(10),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.end,
       children:<Widget>[
         TextField(
           decoration: InputDecoration(labelText: 'Title'),
           controller: titlecontroller,
           keyboardType: TextInputType.text,
           onSubmitted: (_)=>_submitdata,),
           TextField(
           decoration: InputDecoration(labelText: 'amount'),
           controller: amountcontroller,
           keyboardType: TextInputType.number,
           onSubmitted: (_)=>_submitdata,),
           
      Container(
        height: 70,
        child: Row(
          children: [
           Expanded(
            child:Text(subDate==null ?'NO Date Chosen!':
            'Selected Date : ${DateFormat.yMd().format(subDate)}'),),
            FlatButton(
            textColor: Theme.of(context).primaryColor,
              onPressed: _datapicker, 
            child: Text('Choose Date',
            style: TextStyle(fontWeight: FontWeight.bold),))
            ],
        ),
      ),
           RaisedButton(child: Text('Add new transaction'),
           color: Colors.purple,
           textColor: Colors.white,
           onPressed: _submitdata,
         )
       ]

     ),),);


   }
}