import 'package:get/get.dart';

class NoteAppController extends GetxController {
  var noteList = <Map<dynamic, dynamic>>[].obs;

  void AddData(Map<dynamic, dynamic> newData) {
    noteList.add(newData);
  }

  void DeleteData(int index) {
    noteList.removeAt(index);
  }

  void UpdateData(Map<dynamic, dynamic> newData, int index) {
    noteList[index] = newData;
  }
}
