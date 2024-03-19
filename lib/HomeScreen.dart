import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:todo_app/db_services/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool personal = true, college = false, office = false;
  bool suggest = false;
  TextEditingController todoController = TextEditingController();
  Stream? todoStream;

  getonTheLoad() async {
    todoStream = await DatabaseService().getTask(personal
        ? "Personal"
        : college
            ? "College"
            : "Office");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  Widget getWork() {
    return StreamBuilder(
        stream: todoStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot docSnap = snapshot.data.docs[index];
                      return CheckboxListTile(
                        activeColor: Colors.purple.shade200,
                        title: Text(
                          docSnap["work"],
                        ),
                        value: docSnap['yes'],
                        onChanged: (newValue) async {
                          await DatabaseService().tickMethod(
                              docSnap["Id"],
                              personal
                                  ? "Personal"
                                  : college
                                      ? "College"
                                      : "Office");
                          setState(() {
                            Future.delayed(const Duration(seconds: 2), () {
                              DatabaseService().removeMethod(
                                  docSnap["Id"],
                                  personal
                                      ? "Personal"
                                      : college
                                          ? "College"
                                          : "Office");
                            });
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      );
                    },
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          shape: BoxShape.circle, // This ensures the border is circular
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.pink.shade200,
          onPressed: () {
            openBox();
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.red.shade200,
              Colors.purple.shade300,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Text(
                "Hello,",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: const Text(
                "Sahra Sameen,",
                style: TextStyle(
                  fontSize: 44,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: const Text(
                "Empower Your Productivity !",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                personal
                    ? Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade200,
                            border: Border.all(
                              color: Colors
                                  .black, // Specify the color of the border
                              width: 2.0, // Specify the width of the border
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Personal",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          personal = true;
                          college = false;
                          office = false;
                          await getonTheLoad();
                          setState(() {});
                        },
                        child: const Text("Personal",
                            style: TextStyle(fontSize: 20.0))),
                college
                    ? Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade200,
                            border: Border.all(
                              color: Colors
                                  .black, // Specify the color of the border
                              width: 2.0, // Specify the width of the border
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "College",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          personal = false;
                          college = true;
                          office = false;
                          await getonTheLoad();
                          setState(() {});
                        },
                        child: const Text("College",
                            style: TextStyle(fontSize: 20.0))),
                office
                    ? Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade200,
                            border: Border.all(
                              color: Colors
                                  .black, // Specify the color of the border
                              width: 2.0, // Specify the width of the border
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Office",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          personal = false;
                          college = false;
                          office = true;
                          await getonTheLoad();
                          setState(() {});
                        },
                        child: const Text("Office",
                            style: TextStyle(fontSize: 20.0))),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            getWork(),
          ],
        ),
      ),
    );
  }

  Future openBox() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: SingleChildScrollView(
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.cancel),
                            ),
                            const SizedBox(
                              height: 60.0,
                            ),
                            Text(
                              'Add ToDo Activity ~',
                              style: TextStyle(
                                color: Colors.purple.shade400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text("Add Text"),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          )),
                          child: TextField(
                            controller: todoController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter the Activity...",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.purple.shade200,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: 100,
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                String id = randomAlphaNumeric(10);
                                Map<String, dynamic> userTodo = {
                                  "work": todoController.text,
                                  "Id": id,
                                  "Yes": false,
                                };
                                personal
                                    ? DatabaseService()
                                        .addPersonalTask(userTodo, id)
                                    : college
                                        ? DatabaseService()
                                            .addCollegeTask(userTodo, id)
                                        : DatabaseService()
                                            .addOfficeTask(userTodo, id);
                                Navigator.pop(context);
                              },
                              child: const Center(
                                child: Text(
                                  "Add",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ));
  }
}
