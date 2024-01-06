import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 245, 246),
        appBar: AppBar(
            title: const Text('ToDoApp',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            leading: Icon(Icons.menu)),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                width: 400,
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'add new tasks',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 68, 68, 68)),
                        onPressed: () {
                          print('button pressed');
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ))
                  ],
                )),
            Container(
                padding: EdgeInsets.all(15),
                child: const Row(
                  children: [
                    Text(
                      'My tasks',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )
                  ],
                )),
            Container(
              child: Center(child: Text('You haven\'t added any tasks yet')),
            )
          ],
        ));
  }
}
