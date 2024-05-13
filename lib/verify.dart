import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'success.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 243, 245, 1),

      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(242, 243, 245, 1),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/hcclogo.png',height: 50,),
              Text('Holy Cross College',textAlign: TextAlign.center,),
              SizedBox(width: 15,),
            ],
          ),
        ),
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Align the column vertically in the center
        children: [
          Center(
            child: Column(
              children: [
                Text("WE HAVE SENT AN CODE ON YOUR GMAIL",style: TextStyle(fontSize: 18),),
                SizedBox(height: 20,),

                Container(
                  width: 200, // Adjust the width of the TextField as needed
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter code here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  width: 120,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      color: Colors.green  ,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Success()),
                                (route) => false, // Replace all routes until this condition is met (in this case, always return false to replace all routes)
                          );
                        },
                        child: Text(
                          'VERIFY',
                          style: TextStyle(color: Colors.white,),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        height: 40,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HCC-PoD'),
          ],
        ),
      ),

    );
  }
}
