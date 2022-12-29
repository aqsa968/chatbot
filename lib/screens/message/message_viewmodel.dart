import 'dart:io';
import 'dart:math';
import 'package:chatbot/screens/message/message_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class MessageViewModel extends GetxController {
  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();
  String? voiceNote;
  File? documentFile;
  RxBool isRecording = false.obs;
  Rx<File> pickedFile = File('').obs;
  RxList<MessageModel> chatList = <MessageModel>[].obs;
  bool showPlayer = false;
  String? audioPath;
  imgFromCamera() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      pickedFile.value = File(image.path);
      update();
    }
  }

  imgFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedFile.value = File(image.path);
      update();
    }
  }
  pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    print(result);
    if (result != null) {
      documentFile = File(result.files.single.path.toString());
      print(documentFile);
    } else {
      // User canceled the picker
    }
  }
  sendMessage() {
    MessageModel model = MessageModel();
    model.textMessage = messageController.text;
    model.image = pickedFile.value;
    model.voiceMessage = voiceNote;
    model.msgTime = DateFormat('hh:mm a').format(DateTime.now());
    model.msgDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
    model.msgAction = "send";
    // model = model.revers;
    chatList.add(model);
    pickedFile.value = File('');
    model = MessageModel();

    Future.delayed(Duration(seconds: 2), () {
      model.msgAction = "received";
      model.image = File('');
      model.textMessage = "Here";
      model.msgTime = DateFormat('hh:mm a').format(DateTime.now());
      model.msgDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
      chatList.add(model);
    });
  }
}
