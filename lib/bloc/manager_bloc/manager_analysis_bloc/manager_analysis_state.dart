abstract class ManagerAnalysisState {}

class ManagerAnalysisInitialState extends ManagerAnalysisState {}
class FailureAnalysisState extends ManagerAnalysisState {}
class GetAllEmployeeFormState extends ManagerAnalysisState {
  final List<dynamic> allEmployeeForms;

  GetAllEmployeeFormState({required this.allEmployeeForms});
}


