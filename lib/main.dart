

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'request permissions',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('request permission'),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.contact_phone),
              ),
              onTap: () async {
                PermissionStatus contactsStatus =
                await Permission.contacts.request();
                if (PermissionStatus == PermissionStatus.granted) {
                  // you now have access to device contacts
                }
                if (PermissionStatus == PermissionStatus.denied) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('The app needs access to your contacts')));
                }
              },
              title: Text(
                'Access contacts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.photo),
              ),
              onTap: () async {
                PermissionStatus photoStatus =
                await Permission.photos.request();
                if (PermissionStatus == PermissionStatus.granted) {
                  // you now have access to device photos
                }
                if (PermissionStatus == PermissionStatus.denied) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('The app needs access to your photos')));
                }
              },
              title: Text(
                'Access photos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.video_call),
              ),
              onTap: () async {
                PermissionStatus videoStatus =
                await Permission.videos.request();
                if (PermissionStatus == PermissionStatus.granted) {
                  // you now have access to phone videos
                }
                if (PermissionStatus == PermissionStatus.denied) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('The app needs access to your videos')));
                }
              },
              title: Text(
                'Access videos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.location_disabled),
              ),
              onTap: () async {
                PermissionStatus locationStatus =
                    await Permission.location.request();
                if (PermissionStatus == PermissionStatus.granted) {
                  // you now have access to device location
                }
                if (PermissionStatus == PermissionStatus.denied) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('The app needs access to your location')));
                }
              },
              title: Text(
                'Access location',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
