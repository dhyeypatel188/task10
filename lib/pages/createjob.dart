// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:task10/pages/dashbord.dart';

// final formkey = GlobalKey<FormState>();

// class Createjob extends StatefulWidget {
//   const Createjob({super.key});

//   @override
//   State<Createjob> createState() => _CreatejobState();
// }

// class _CreatejobState extends State<Createjob> {
//   List joblist = [
//     ["Software Developer", "IT", "Nothing"],
//     ["Data Sciece", "Netflix", "Nothing "]
//   ];

//   final joncontroller = TextEditingController();
//   final companynamecontroller = TextEditingController();
//   final descriptioncontroller = TextEditingController();

//   final _jobs = Hive.box('jobs');

//   late int count = 0;
//   //writedata
//   void writedata() {
//     setState(() {
//       // count = count + 1;
//       // print(count);
//       // _jobs.put(count + 1, [
//       //   joncontroller.text,
//       //   companynamecontroller.text,
//       //   descriptioncontroller.text
//       // ]);

//       joblist.add([
//         joncontroller.text,
//         companynamecontroller.text,
//         descriptioncontroller.text
//       ]);
//     });
//     Navigator.push(
//         context as BuildContext,
//         MaterialPageRoute(
//             builder: (context) => DashbordPage(
//                   jblist: joblist,
//                 )));

//     // print(_jobs.get(count + 1)[0].toString());s
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("CreateJob"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: formkey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: joncontroller,
//                 decoration: InputDecoration(labelText: "Job name"),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Enter Something';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: companynamecontroller,
//                 decoration: InputDecoration(labelText: "Company name"),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Enter Something';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: descriptioncontroller,
//                 decoration: InputDecoration(labelText: "Description"),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Enter Something';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextButton(
//                   onPressed: () {
//                     writedata();
//                   },
//                   child: Text("Submit"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
