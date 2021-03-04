import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Text(
              "Textmail@gmail.com",
              style: TextStyle(fontSize: 15.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  "Phone number",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Text(
              "111-1 111 111",
              style: TextStyle(fontSize: 15.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.accessibility_rounded,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  "About",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 150.0,
              child: Column(
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Back")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
