import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';


void main(){
  runApp(MaterialApp(home: Homepage(),debugShowCheckedModeBanner: false,));
}

enum UserType { student, employee, visitor }


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DateTime? _selectedDate;

  TimeOfDay? _selectedTime;
  TextEditingController locationincident = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController coursegradesec = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  UserType? _userType;



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(), // Set the last selectable date to today's date
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }


  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/hcclogo.png',height: 70,),
            Text('Holy Cross College'),
            SizedBox(width: 15,),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Column(
                  children: [
                    Text('Student Discipline Services Division',style: TextStyle(color: Colors.blue),),
                    Text('INCIDENT REPORT FORM',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), // Outline border color
                  color: Colors.green, // Fill color
                  borderRadius: BorderRadius.circular(5), // Optional: border radius
                ),
                child: Row(
                  children: [
                    Column(
                      children: [

                        Text('   Personal Information',style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 100, top: 10,bottom: 10 ),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Full Name: ',style: TextStyle(fontSize: 15),),
                        SizedBox(width: 10,),
                      ],
                    ),
                    TextField(
                      controller: fullname,
                      decoration: InputDecoration(
                        hintText: 'ex. Dela Cruz, Juan, Ponce',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15,),

                    Row(
                      children: [
                        Text('Course/Year & Sec. : ',style: TextStyle(fontSize: 15),),
                        SizedBox(width: 10,),
                      ],
                    ),

                    TextField(
                      controller: coursegradesec,
                      decoration: InputDecoration(
                        hintText: 'ex. BSCS-3A',
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: 15,),

                    Row(
                      children: [
                        Text('Home Address  : ',style: TextStyle(fontSize: 15),),
                        SizedBox(width: 10,),
                      ],
                    ),
                    TextField(
                      controller: address,
                      decoration: InputDecoration(
                        hintText: 'ex. house# , street, brgy, municipality, province',
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: 15,),

                    Row(
                      children: [
                        Text('Phone Number : ',style: TextStyle(fontSize: 15),),
                        SizedBox(width: 10,),
                      ],
                    ),

                    TextField(
                      keyboardType: TextInputType.phone, // Set keyboard type to phone
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Allow only digits
                        LengthLimitingTextInputFormatter(11), // Limit length to 11 digits
                      ],
                      controller: phonenumber,
                      decoration: InputDecoration(
                        hintText: 'ex. 09123456789',
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            Text('Please Select one :', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Wrap(
                          children: [
                            RadioListTile<UserType>(
                              title: Text('Student'),
                              value: UserType.student,
                              groupValue: _userType,
                              onChanged: (UserType? value) {
                                setState(() {
                                  _userType = value;
                                });
                              },
                            ),
                            RadioListTile<UserType>(
                              title: Text('Employee'),
                              value: UserType.employee,
                              groupValue: _userType,
                              onChanged: (UserType? value) {
                                setState(() {
                                  _userType = value;
                                });
                              },
                            ),
                            RadioListTile<UserType>(
                              title: Text('Visitor'),
                              value: UserType.visitor,
                              groupValue: _userType,
                              onChanged: (UserType? value) {
                                setState(() {
                                  _userType = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), // Outline border color
                  color: Colors.green, // Fill color
                  borderRadius: BorderRadius.circular(5), // Optional: border radius
                ),
                child: Row(
                  children: [
                    Column(
                      children: [

                        Text('   INFORMATION ABOUT THE INCIDENT',style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          'Date of Incident :',style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Select Date',
                              border: UnderlineInputBorder(),
                            ),
                            controller: TextEditingController(
                              text: _selectedDate == null ? '' : _selectedDate.toString().substring(0, 10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            'Time of Incident :',style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 100),
                        child: InkWell(
                          onTap: () => _selectTime(context), // Open the time picker dialog
                          child: AbsorbPointer(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Select Time',
                                border: UnderlineInputBorder(),
                              ),
                              controller: TextEditingController(
                                text: _selectedTime == null ? '' : _selectedTime!.format(context),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10,right: 110),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Location of Incident : ',style: TextStyle(fontSize: 15),),
                        SizedBox(width: 10,),
                      ],
                    ),

                    TextField(
                      controller: locationincident,
                      decoration: InputDecoration(
                        hintText: 'ex. street, brgy,',
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Expanded(child: Text('Description of Incident :',style: TextStyle(fontSize: 15,),)),
                      ],
                    ),
                    TextField(
                      maxLines: null, // Allows for multiple lines of text input
                      keyboardType: TextInputType.multiline, // Specifies the keyboard type to multiline
                      decoration: InputDecoration(
                        hintText: 'what happened, factors leading to the event, etc. be as specific as possible',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            )




          ],
        ),
      ),
    );
  }
}
