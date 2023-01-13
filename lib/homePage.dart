import 'dart:developer';

import 'package:cbo_test/database/databaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bloc/employee_bloc.dart';
import 'employeeList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController employeeCodeController = TextEditingController();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        title: Text(
          "HomePage",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<EmployeeBloc, EmployeeState>(
          listener: (context, state) {
            if(state is EmployeeInsertSuccessState) {
              if(state.result == "0") {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: (Text("Employee code already exists, Please enter different employee code"))));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>BlocProvider(
                          create: (_)=> EmployeeBloc(),
                          child: EmployeeList(),
                        )
                    )
                );
              }
            }
          },
         builder: (context, state) {
           return  Container(
             height: MediaQuery
                 .of(context)
                 .size
                 .height,
             color: Colors.white,

             child: Column(
               children: [
                 InkWell(
                   onTap: () async {
                     var dbHelper = DatabaseHelper.instance;
                     // var result = await dbHelper.getEmployeeRecord();

                     // log("Result===$result");

                     await dbHelper.getEmployeeSingleRecord();
                   },
                   child: Container(
                     margin: EdgeInsets.all(8),
                     child: Text("Employee Master", style: TextStyle(
                         fontSize: 26, decoration: TextDecoration.underline),),
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                         margin: EdgeInsets.only(left: 6),
                         child: Text(
                           "Employee Code", style: TextStyle(fontSize: 18),)),
                     SizedBox(
                       width: 230,
                       child: Container(
                         margin: const EdgeInsets.only(
                             left: 8, top: 10, right: 10, bottom: 9),
                         // /  height: 60,
                         padding: const EdgeInsets.all(3),
                         decoration: BoxDecoration(

                             border: Border.all(color: Colors.black, width: 1),
                             color: Colors.white),
                         child: TextFormField(
                           controller: employeeCodeController,
                           textInputAction: TextInputAction.done,
                           style: TextStyle(
                             fontWeight: FontWeight.w400,
                             fontSize: 13,
                           ),
                           decoration: InputDecoration(

                             isDense: true,
                             focusColor: Colors.grey,

                             hintStyle: TextStyle(
                               fontSize: 13.0,
                               fontWeight: FontWeight.w300,
                               color: Colors.grey,
                             ),
                             border: InputBorder.none,
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                         margin: EdgeInsets.only(left: 6),
                         child: Text(
                           "Employee Name", style: TextStyle(fontSize: 18),)),
                     SizedBox(
                       width: 230,
                       child: Container(
                         margin: const EdgeInsets.only(
                             left: 8, top: 10, right: 10, bottom: 9),
                         // /  height: 60,
                         padding: const EdgeInsets.all(3),
                         decoration: BoxDecoration(

                             border: Border.all(color: Colors.black, width: 1),
                             color: Colors.white),
                         child: TextFormField(
                           controller: employeeNameController,
                           textInputAction: TextInputAction.done,
                           style: TextStyle(
                             fontWeight: FontWeight.w400,
                             fontSize: 13,
                           ),
                           decoration: InputDecoration(

                             isDense: true,
                             focusColor: Colors.grey,

                             hintStyle: TextStyle(
                               fontSize: 13.0,
                               fontWeight: FontWeight.w300,
                               color: Colors.grey,
                             ),
                             border: InputBorder.none,
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                         margin: EdgeInsets.only(left: 6),
                         child: Text(
                           "Address 1", style: TextStyle(fontSize: 18),)),
                     SizedBox(
                       width: 230,
                       child: Container(
                         margin: const EdgeInsets.only(
                             left: 8, top: 10, right: 10, bottom: 9),
                         // /  height: 60,
                         padding: const EdgeInsets.all(3),
                         decoration: BoxDecoration(

                             border: Border.all(color: Colors.black, width: 1),
                             color: Colors.white),
                         child: TextFormField(
                           controller: addressController,
                           textInputAction: TextInputAction.done,
                           style: TextStyle(
                             fontWeight: FontWeight.w400,
                             fontSize: 13,
                           ),
                           decoration: InputDecoration(

                             isDense: true,
                             focusColor: Colors.grey,

                             hintStyle: TextStyle(
                               fontSize: 13.0,
                               fontWeight: FontWeight.w300,
                               color: Colors.grey,
                             ),
                             border: InputBorder.none,
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                         margin: EdgeInsets.only(left: 6),
                         child: Text(
                           "Mobile No.   ", style: TextStyle(fontSize: 18),)),
                     SizedBox(
                       width: 230,
                       child: Container(
                         margin: const EdgeInsets.only(
                             left: 8, top: 10, right: 10, bottom: 9),
                         // /  height: 60,
                         padding: const EdgeInsets.all(3),
                         decoration: BoxDecoration(

                             border: Border.all(color: Colors.black, width: 1),
                             color: Colors.white),
                         child: TextFormField(
keyboardType: TextInputType.number,
                           inputFormatters: [LengthLimitingTextInputFormatter(10)],
                           controller: mobileController,
                           textInputAction: TextInputAction.done,
                           style: TextStyle(
                             fontWeight: FontWeight.w400,
                             fontSize: 13,
                           ),
                           decoration: InputDecoration(

                             isDense: true,
                             focusColor: Colors.grey,

                             hintStyle: TextStyle(
                               fontSize: 13.0,
                               fontWeight: FontWeight.w300,
                               color: Colors.grey,
                             ),
                             border: InputBorder.none,
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                         margin: EdgeInsets.only(left: 6),
                         child: Text(
                           "Date of Birth   ", style: TextStyle(fontSize: 18),)),
                     SizedBox(
                       width: 230,
                       child: Container(
                         margin: const EdgeInsets.only(
                             left: 8, top: 10, right: 10, bottom: 9),
                         // /  height: 60,
                         padding: const EdgeInsets.all(3),
                         decoration: BoxDecoration(

                             border: Border.all(color: Colors.black, width: 1),
                             color: Colors.white),
                         child: TextFormField(
                           controller: dobController,
                           onTap: () {
                             showModalBottomSheet(
                                 context: context,
                                 builder: (context) {
                                   return BottomSheet(
                                     onClosing: () {
                                       Navigator.of(context).pop();
                                     },
                                     builder: (BuildContext context) {
                                       return Container(
                                         decoration: BoxDecoration(
                                             borderRadius:
                                             BorderRadius.circular(24),
                                             color: Colors.white),
                                         // color: Colors.white,
                                         height: 200,
                                         child: CupertinoDatePicker(
                                           mode: CupertinoDatePickerMode.date,
                                           initialDateTime: DateTime.now(),
                                           minimumDate: DateTime(1947),
                                           maximumDate: DateTime.now(),
                                           onDateTimeChanged: (dateTime) {
                                             setState(() {
                                               dobController.text = dateFormater(
                                                   dateTime.toString(),
                                                   "dd-MM-yyyy");
                                             });
                                           },
                                         ),
                                       );
                                     },
                                   );
                                 });
                             // showDatePicker(
                             //         context: context,
                             //         initialDate: DateTime.now(),
                             //         firstDate: DateTime(1947),
                             //         lastDate: DateTime.now())
                             //     .then((date) {
                             //   setState(() {
                             //     dobcontroller.text = dateFormater(
                             //       date!.toString(),
                             //       "dd-MMM-yyyy",
                             //     );
                             //   });
                             // });
                           },
                           textInputAction: TextInputAction.done,
                           style: TextStyle(
                             fontWeight: FontWeight.w400,
                             fontSize: 13,
                           ),
                           decoration: InputDecoration(

                             isDense: true,
                             focusColor: Colors.grey,

                             hintStyle: TextStyle(
                               fontSize: 13.0,
                               fontWeight: FontWeight.w300,
                               color: Colors.grey,
                             ),
                             border: InputBorder.none,
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                         margin: EdgeInsets.only(left: 6),
                         child: Text(
                           "Remarks   ", style: TextStyle(fontSize: 18),)),
                     SizedBox(
                       width: 230,
                       height: 120,
                       child: Container(
                         margin: const EdgeInsets.only(
                             left: 8, top: 10, right: 10, bottom: 9),
                         // /  height: 60,
                         padding: const EdgeInsets.all(3),
                         decoration: BoxDecoration(

                             border: Border.all(color: Colors.black, width: 1),
                             color: Colors.white),
                         child: TextFormField(
                           controller: remarksController,
                           textInputAction: TextInputAction.done,
                           style: TextStyle(
                             fontWeight: FontWeight.w400,
                             fontSize: 13,
                           ),
                           decoration: InputDecoration(

                             isDense: true,
                             focusColor: Colors.grey,

                             hintStyle: TextStyle(
                               fontSize: 13.0,
                               fontWeight: FontWeight.w300,
                               color: Colors.grey,
                             ),
                             border: InputBorder.none,
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
                 Container(
                   margin: EdgeInsets.only(top: 14),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       GestureDetector(
                         onTap: () {
                           var empCode = employeeCodeController.text;
                           var empName = employeeNameController.text;
                           var empMobile = mobileController.text;
                           var empDOB = dobController.text;
                           var address = addressController.text;
                           var remarks = remarksController.text;
                           var salary = employeeCodeController.text;
                           var dateOfJoining = DateTime.now().toString();


                           BlocProvider.of<EmployeeBloc>(context).add(InsertEmployeeRecordEvent(empCode, empName, empMobile, empDOB, dateOfJoining, address, remarks, salary));
                         },
                         child: Container(
                             margin: EdgeInsets.only(left: 6),
                             decoration: BoxDecoration(
                               color: Colors.amberAccent,
                               borderRadius: BorderRadius.circular(4),

                             ),
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text(
                                 "SAVE ", style: TextStyle(fontSize: 18),),
                             )),
                       ),
                       // GestureDetector(
                       //   onTap: (){
                       //     var empCode = employeeCodeController.text;
                       //
                       //     BlocProvider.of<EmployeeBloc>(context).add(DeleteEmployeeEvent(empCode));
                       //   },
                       //   child: Container(
                       //       margin: EdgeInsets.only(left: 6),
                       //       decoration: BoxDecoration(
                       //         color: Colors.amberAccent,
                       //         borderRadius: BorderRadius.circular(4),
                       //
                       //       ),
                       //       child: Padding(
                       //         padding: const EdgeInsets.all(8.0),
                       //         child: Text("DELETE ",
                       //           style: TextStyle(fontSize: 18),),
                       //       )),
                       // ),
                       GestureDetector(
                         onTap: (){
                           setState(() {
                             CircularProgressIndicator();
                           });
                         },
                         child: Container(
                             margin: EdgeInsets.only(right: 6),
                             decoration: BoxDecoration(
                               color: Colors.amberAccent,
                               borderRadius: BorderRadius.circular(4),

                             ),
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text("Load ",
                                 style: TextStyle(fontSize: 18),),
                             )),
                       ),

                     ],
                   ),
                 ),
               ],
             ),
           );
         },
        )
      ),
    );
  }

  String dateFormater(String date, String dateFormat){
    var formatedDate = "";
    print(dateFormater);
    try {
      var formatDate = DateTime.parse(date);
      formatedDate = DateFormat(dateFormat).format(formatDate);
    } catch(e) {
      log("StackTrace====$e");
    }
    return formatedDate;
  }
}
