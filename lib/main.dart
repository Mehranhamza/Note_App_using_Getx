import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_using_getx/getx/Getx_controller.dart';
import 'package:note_app_using_getx/widgets/AddData.dart';
import 'package:note_app_using_getx/widgets/ReadData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note App using Getx',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController DescController = TextEditingController();

  final NoteAppController noteController = Get.put(NoteAppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Note App using Getx',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
      ),
      body: Column(
        children: [
          Center(
            child: AddData(
                titleController: titleController,
                DescController: DescController,
                noteController: noteController),
          ),
          ReadData(noteController: noteController)
        ],
      ),
    );
  }
}
