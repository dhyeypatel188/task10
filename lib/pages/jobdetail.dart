import 'package:flutter/material.dart';
import 'package:task10/data/database.dart';

class JobDetail extends StatefulWidget {
  const JobDetail({super.key});

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  JobDataBase db = JobDataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Job Detail"),
        ),
        body: Expanded(
          child: ListView.builder(
              itemCount: db.joblist.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Column(
                    children: [
                      Text(db.joblist[index][0]),
                      Text(db.joblist[index][1]),
                      Text(db.joblist[index][2])
                    ],
                  ),
                );
              }),
        ));
  }
}
