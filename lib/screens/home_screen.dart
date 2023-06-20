import 'dart:math';

import 'package:flutter/material.dart';
import 'package:live_stream_with_zego_cloud/screens/live_screen_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController liveIdController = TextEditingController();
  String userId = Random().nextInt(900000 + 100000).toString();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Live Streaming With Zego cloud',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your User Id $userId"),
            SizedBox(
              height: height * 0.06,
            ),
            TextFormField(
              controller: liveIdController,
              decoration: const InputDecoration(
                labelText: "Join or Start a live by Input an ID",
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => LiveScreenView(
                      liveId: liveIdController.text,
                      userId: userId,
                      isHost: true,
                    ),
                  ),
                );
              },
              child: const Text(
                "Start a live",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => LiveScreenView(
                      liveId: liveIdController.text,
                      userId: userId,
                      isHost: false,
                    ),
                  ),
                );
              },
              child: const Text(
                "Join a live",
              ),
            )
          ],
        ),
      ),
    );
  }
}
