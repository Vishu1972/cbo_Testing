part of 'employee_bloc.dart';

@immutable

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();
}

class GettingEmployeeMasterEvent extends EmployeeEvent{

  @override
  List<Object?> get props => [];
 }

 class InsertEmployeeRecordEvent extends EmployeeEvent {
    String? empCode;
    String? empName;
    String? empMobile;
    String? empDOB;
    String? dateOfJoining;
    String? address;
    String? remarks;
    String? salary;

    InsertEmployeeRecordEvent(this.empCode, this.empName, this.empMobile,this.empDOB,this.dateOfJoining,this.address,this.remarks,this.salary);

   @override
   List<Object?> get props => [];
 }

 class DeleteEmployeeEvent extends EmployeeEvent {
  int? empCode;
  List? employeeList;
  DeleteEmployeeEvent(this.empCode, this. employeeList);

  @override
  List<Object?> get props => [];
 }
