part of 'employee_bloc.dart';

@immutable
abstract class EmployeeState {}

class EmployeeInitial extends EmployeeState {}
class GettingEmployeeMasterState extends EmployeeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class GetEmployeeMasterState extends EmployeeState{

  final List? employeeList;
  GetEmployeeMasterState(this.employeeList);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmployeeInsertSuccessState extends EmployeeState {
  final String? result;
  EmployeeInsertSuccessState(this.result);

  @override
  List<Object?> get props => [];
}

class GetEmployeeMasterErrorState extends EmployeeState{
  final String? error;
  GetEmployeeMasterErrorState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}