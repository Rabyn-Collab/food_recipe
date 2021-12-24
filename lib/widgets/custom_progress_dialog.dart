import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

class CustomProgressBar{

  static CustomProgressDialog getBar(BuildContext context){
    CustomProgressDialog progressDialog = CustomProgressDialog(
        context,blur: 4, dismissable: true,
        loadingWidget: Card(
          child: Container(
            padding:  const EdgeInsets.symmetric(horizontal: 50),
            height: 70,
            child: Row(
              children: [
                CircularProgressIndicator(
                  color:  Color(0xFF942CAE),
                ),
                SizedBox(width: 25,),
                Text('Please Wait....', style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
        )
    );
    return progressDialog;
  }

  static dismissBar(CustomProgressDialog progressDialog) async{
    await Future.delayed(Duration(seconds: 1));
    progressDialog.dismiss();
  }

}