import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final jobname;
  final companyname;
  final description;

  VoidCallback onsave;
  VoidCallback oncancel;
  DialogBox(
      {super.key,
      required this.jobname,
      required this.companyname,
      required this.description,
      required this.onsave,
      required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.blue[100],
        content: Container(
            height: 350,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: jobname,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Add a Job name"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: companyname,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Add a Company name"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: description,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Add Description"),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: onsave,
                      child: Text("Save"),
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    MaterialButton(
                      onPressed: oncancel,
                      child: Text("Cancel"),
                      color: Colors.blue,
                    ),
                  ],
                )
              ],
            )));
  }
}
