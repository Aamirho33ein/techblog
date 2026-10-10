import 'package:file_picker/file_picker.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:tec/controller/file_controller.dart';

FileController fileController = Get.put(FileController());
Future pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
  if(result != null && result.files.isNotEmpty){
fileController.file.value = result.files.first;
  }
}
