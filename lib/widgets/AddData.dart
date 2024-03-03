import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:note_app_using_getx/getx/Getx_controller.dart';

class AddData extends StatelessWidget {
  const AddData({
    super.key,
    required this.titleController,
    required this.DescController,
    required this.noteController,
  });

  final TextEditingController titleController;
  final TextEditingController DescController;
  final NoteAppController noteController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextFormField(
            controller: titleController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter title'.toUpperCase()),
                icon: Icon(Icons.title)),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextFormField(
            controller: DescController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter Description'.toUpperCase()),
                icon: Icon(Icons.description)),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        ElevatedButton.icon(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blue.shade900),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              Map<dynamic, dynamic> noteMap = {
                'Title': titleController.text,
                'Description': DescController.text,
                'Status': false
              };

              noteController.AddData(noteMap);

              Get.snackbar('Congratulation', 'Note added successfully',
                  colorText: Colors.white,
                  backgroundColor: Colors.green.shade900,
                  snackPosition: SnackPosition.BOTTOM);
            },
            icon: Icon(Icons.add),
            label: Text('Add Note'))
      ],
    );
  }
}
