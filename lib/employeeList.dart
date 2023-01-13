import 'package:cbo_test/bloc/employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {

  List employeeList = [];
  TextEditingController employeeCodeController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<EmployeeBloc>(context).add(GettingEmployeeMasterEvent());
  }
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
          "Employee List",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<EmployeeBloc, EmployeeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if(state is GetEmployeeMasterState) {
              employeeList = state.employeeList!;

              if(employeeList.length > 0) {
                return Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    child: ListView.builder(
                      itemCount: state.employeeList!.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                          margin: EdgeInsets.all(8),
                          shadowColor: Colors.blue,
                          elevation: 5,
                          child: Column(
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                  margin: EdgeInsets.all(8),
                                  alignment: Alignment.topLeft,
                                  child: Text("EMPCODE:- ${employeeList[index]['empCode']}"),
                            ),
                                  GestureDetector(
                                    onTap: (){
                                      var empCode = employeeCodeController.text;

                                      BlocProvider.of<EmployeeBloc>(context).add(DeleteEmployeeEvent(empCode));
                                    },
                                    child: Container(
                                        alignment: Alignment.topRight,
                                        margin: EdgeInsets.only(top: 12,right: 8),
                                        child: Icon(Icons.delete,color: Colors.red,)),
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.all(8),
                                alignment: Alignment.topLeft,
                                child: Text("EMPMOBILE:- ${employeeList[index]['empMobile']}"),
                              ),
                              Container(
                                margin: EdgeInsets.all(8),
                                alignment: Alignment.topLeft,
                                child: Text(
                                    "EMPNAME:- ${employeeList[index]['empName']}"),
                              ),
                              Container(
                                margin: EdgeInsets.all(8),
                                alignment: Alignment.topLeft,
                                child: 
                                
                                Text("EMPDOJ :- ${employeeList[index]['dateofjoining']}"),
                              ),
                              Container(
                                margin: EdgeInsets.all(8),
                                alignment: Alignment.topLeft,
                                child: Text("EMPDOB :- ${employeeList[index]['empDOB']}"),
                              ),

                            
                            ],
                          ),
                        );
                      },
                    )

                );
              } else {
                return Center(child: Text("No Employee Record Found"));
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }

          },
        ),
      ),
    );
  }
}
