import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:note_app_using_getx/getx/Getx_controller.dart';

class ReadData extends StatelessWidget {
  ReadData({
    super.key,
    required this.noteController,
  });

  final NoteAppController noteController;

  @override
  TextEditingController titleController = TextEditingController();
  TextEditingController DescController = TextEditingController();
  Widget build(BuildContext context) {
    return Expanded(child: Obx(() {
      return ListView.builder(
        itemCount: noteController.noteList.length,
        itemBuilder: (context, index) {
          Map<dynamic, dynamic> note = noteController.noteList[index];
          return Card(
              shadowColor: Colors.blue.shade600,
              elevation: 10,
              child: ListTile(
                  title: Text('Title: ${note['Title']}'),
                  subtitle: Text('Title: ${note['Description']}'),
                  trailing: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        noteController.DeleteData(index);
                        Get.snackbar('Deleted', 'Note Delete',
                            colorText: Colors.white,
                            backgroundColor: Colors.red.shade900,
                            snackPosition: SnackPosition.BOTTOM);
                      },
                      child: Text('Delete')),
                  leading: ElevatedButton(
                    child: Text('Update'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      Get.defaultDialog(
                          title: 'Update the note',
                          content: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: TextFormField(
                                  controller: DescController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text(
                                          'Enter Description'.toUpperCase()),
                                      icon: Icon(Icons.description)),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                            ],
                          ),
                          onConfirm: () {
                            Map<dynamic, dynamic> noteMap = {
                              'Title': titleController.text,
                              'Description': DescController.text,
                            };

                            noteController.UpdateData(noteMap, index);
                            Get.snackbar(
                                'Congratulation', 'Note Updated successfully',
                                colorText: Colors.white,
                                backgroundColor: Colors.green.shade900,
                                snackPosition: SnackPosition.BOTTOM);
                          },
                          onCancel: () {
                            Get.back();
                          });
                    },
                  )));
        },
      );
    }));
  }
}
