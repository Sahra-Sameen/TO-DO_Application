import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool personal = true, college = false, office = false;
  bool suggest = false;

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
          onPressed: () {},
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
                        onTap: () {
                          personal = true;
                          college = false;
                          office = false;
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
                        onTap: () {
                          personal = false;
                          college = true;
                          office = false;
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
                        onTap: () {
                          personal = false;
                          college = false;
                          office = true;
                          setState(() {});
                        },
                        child: const Text("Office",
                            style: TextStyle(fontSize: 20.0))),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CheckboxListTile(
              activeColor: Colors.purple.shade200,
              title: const Text(
                "Practice Coding for atleast 2 Hours !",
              ),
              value: suggest,
              onChanged: (newValue) {
                setState(() {
                  suggest = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              activeColor: Colors.purple.shade200,
              title: const Text(
                "Go to Lectures !",
              ),
              value: suggest,
              onChanged: (newValue) {
                setState(() {
                  suggest = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ],
        ),
      ),
    );
  }
}
