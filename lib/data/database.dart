import 'package:hive/hive.dart';

class JobDataBase {
  List joblist = [];
  final jobs = Hive.box('jobs');

  void createInitialData() {
    joblist = [
      ["software", "it", "nothing"],
      ["dbms", "it", "nothing"]
    ];
  }

  void loadData() {
    joblist = jobs.get("LIST");
  }

  void updateDatabase() {
    jobs.put("LIST", joblist);
  }
}
