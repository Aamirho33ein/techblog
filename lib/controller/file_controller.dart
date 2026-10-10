import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tec/services/pick_file.dart';

FileController fileController = Get.put(FileController());

class FileController extends GetxController {
  final Rxn<PlatformFile> file = Rxn<PlatformFile>();
  
}
