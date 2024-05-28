import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:task10/card.dart';
import 'package:task10/data/database.dart';
import 'package:task10/dialogbox.dart';
import 'package:task10/model/jobdatamodel.dart';
import 'package:task10/pages/jobdetail.dart';
import 'package:task10/pages/profile.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  int mycurrentindex = 0;
  final List screen = const [Dashbord(), ProfilePage()];

  final jobcontroller = TextEditingController();
  final companycontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();

  JobDataBase db = JobDataBase();

  final _jobs = Hive.box('jobs');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (_jobs.get("LIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  void createnewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            jobname: jobcontroller,
            companyname: companycontroller,
            description: descriptioncontroller,
            onsave: () {
              setState(() {
                db.joblist.add([
                  jobcontroller.text,
                  companycontroller.text,
                  descriptioncontroller.text
                ]);
                jobcontroller.clear();
                companycontroller.clear();
                descriptioncontroller.clear();
                db.updateDatabase();
              });
              Navigator.of(context).pop();
            },
            oncancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: createnewTask,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dashbord()));
                  },
                  icon: Icon(Icons.dashboard)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                  icon: Icon(Icons.person)),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Dashbord"),
      ),
      body: Column(children: [
        Text(
          "Total ${db.joblist.length} job craeted",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: db.joblist.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomCard(
                jobname: db.joblist[index][0],
                companyname: db.joblist[index][1],
                datetime: DateTime.now().toString(),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => JobDetail())),
              );
            },

            //
          ),
        ),
      ]),
    );
  }
}
