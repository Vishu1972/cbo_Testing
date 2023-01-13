import 'dart:async';

import 'package:cbo_test/database/databaseHelper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  static List? employeeList;
  EmployeeBloc() : super(EmployeeInitial()) {
    on<EmployeeEvent>((event, emit) {

    });

    on<InsertEmployeeRecordEvent>(_onInsertEmployeeData);
    on<GettingEmployeeMasterEvent>(_onFetchEmployeeRecord);
    on<DeleteEmployeeEvent>(_onDeleteEmployee);
  }

  void _onInsertEmployeeData(InsertEmployeeRecordEvent event, emit) async {
    DatabaseHelper dbHelper = DatabaseHelper.instance;

    var result = await dbHelper.insertEmployeeRecord(
        empCode: event.empCode,
        empName: event.empName,
        empMobile: event.empMobile,
      empDOB: event.empDOB,
      dateofjoining: event.dateOfJoining,
      salary: event.salary,
      address: event.address,
      remarks: event.remarks,

    );

    if(result != null) {
      emit(EmployeeInsertSuccessState("$result"));
    } else{
      emit(GetEmployeeMasterErrorState(null));
    }
  }

  void _onFetchEmployeeRecord(GettingEmployeeMasterEvent event, emit) async {
    DatabaseHelper dbHelper = DatabaseHelper.instance;

    var result = await dbHelper.getEmployeeRecord();

    employeeList = result.toList();
    if(result != null) {
      emit(GetEmployeeMasterState(result.toList()));
    } else{
      emit(GetEmployeeMasterErrorState(null));
    }
  }

  void  _onDeleteEmployee(DeleteEmployeeEvent event, emit) async {
    DatabaseHelper dbHelper = DatabaseHelper.instance;


    var result = await dbHelper.deleteEmployeeRecord(event.empCode);

    if(result != null) {
      event.employeeList!.removeWhere((element) => element['empCode'] == event.empCode );
      emit(EmployeeDeleteSuccessState(event.employeeList));
    } else{
      emit(GetEmployeeMasterErrorState(null));
    }
  }
}
