import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatbot/widgets/bottomsheet_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helper/theme.dart';
import 'message_viewmodel.dart';

class MessageView extends StatelessWidget {
  MessageViewModel viewModel = Get.put(MessageViewModel());

  MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
        body: Container(
          constraints: BoxConstraints.expand(height: Get.height),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/background.jpg",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              messageBody(),
              Container(
                padding: EdgeInsets.only(top: 5),
                width: double.infinity,
                child: Column(
                  children: [
                    writeMessage(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(65),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff1F2C34),
        elevation: 1,
        flexibleSpace: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CachedNetworkImage(
                height: 45,
                width: 45,
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGxUpHaEGej6UaW1kltiUkhvNCkoVSYWuSew&usqp=CAU',
                imageBuilder: (context, imageProvider) {
                  return CircleAvatar(
                      radius: 20, backgroundImage: imageProvider);
                },
                errorWidget: (context, url, error) {
                  return CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                      'assets/images/profile.png',
                    ),
                  );
                },
                placeholder: (context, url) {
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2.0),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Aqsa Razaq',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Online",
                      style: TextStyle(fontSize: 12.5, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageBody() {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          // shrinkWrap: true,
      //    reverse: true,
          itemCount: viewModel.chatList.length,
          itemBuilder: (context, index) {
            return messageListViewItem(index);
          },
        ),
      ),
    );
  }

  Widget messageListViewItem(int index) {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14, top: 3, bottom: 3),
      child: Align(
        alignment: (viewModel.chatList[index].msgAction == "received"
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: Get.width - 60,
                minWidth: Get.width / 2 - 70,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  color: Color(0xff005C4B)),
              padding:
                  EdgeInsets.only(left: 14, right: 14, bottom: 12, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(viewModel.chatList[index].textMessage ?? ""),
                  (viewModel.chatList[index].image?.path != null &&
                          viewModel.chatList[index].image?.path != '')
                      ? image(viewModel.chatList[index].image!)
                      : SizedBox(),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: Get.width - 60, minWidth: Get.width / 2 - 70),
              margin: EdgeInsets.only(bottom: 2, top: 2, left: 5),
              child: Text(
                 (viewModel.chatList[index].msgTime ?? ""),
                style: TextStyle(
                    fontSize: 12, fontFamily: "fontMulish", color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget writeMessage(BuildContext context) {
    return Container(
      //  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        //  borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xff1F2C34),
      ),
      child: Row(
        children: [
          Obx(
            () => (viewModel.pickedFile.value.path != "")
                ? Image.file(
                    viewModel.pickedFile.value,
                    height: 50,
                    width: 40,
                  )
                : Container(),
          ),
          // Obx(
          //       () => (viewModel.documentFile?.path != "")
          //       ? Image.file(
          //    File( viewModel.documentFile!.path),
          //     height: 50,
          //     width: 40,
          //   )
          //       : Container(),
          // ),
          Expanded(
            child: TextField(
              controller: viewModel.messageController,
              textInputAction: TextInputAction.send,
              maxLines: 2,
              minLines: 1,
              onChanged: (value) {},
              onSubmitted: (txt) {
                viewModel.sendMessage();
                viewModel.messageController.clear();
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: " Write message .....",
                hintStyle: TextStyle(
                  color: context.isDarkMode
                      ? ThemeColors.dark3
                      : ThemeColors.brown2,
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          ClipOval(
            child: Material(
              shape: CircleBorder(),
              color: Colors.transparent,
              child: Transform.rotate(
                angle: -25.5,
                child: IconButton(
                  onPressed: () {
                    selectImageBottomSheet(context);
                  },
                  icon: Icon(Icons.attachment),
                  color: context.isDarkMode
                      ? ThemeColors.dark3
                      : ThemeColors.brown2,
                  iconSize: 25,
                ),
              ),
            ),
          ),
          ClipOval(
            child: Material(
              shape: CircleBorder(),
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {
                  viewModel.imgFromCamera();
                },
                icon: Icon(Icons.camera_alt_sharp),
                color:
                    context.isDarkMode ? ThemeColors.dark3 : ThemeColors.brown2,
                iconSize: 25,
              ),
            ),
          ),
          // VoiceMessage(
          //   audioSrc: 'YOUR_AUDIO_URL',
          //   played: false, // To show played badge or not.
          //   me: true, // Set message side.
          //   onPlay: () {}, // Do something when voice played.
          // ),

          ClipOval(
            child: Container(
              color: Color(0xffCCE4F7),
              width: 40,
              height: 40,
              child: FloatingActionButton(
                onPressed: () {
                  //   viewModel.sendMessage();
                  viewModel.isRecording();
                },
                backgroundColor: Color(0xffCCE4F7),
                elevation: 0,
                child:    IconButton(
                  icon: viewModel.isRecording.value ? Icon(Icons.stop) : Icon(Icons.mic),
                  onPressed: (){

                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  selectImageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Image',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 0.5,
                            color: context.isDarkMode
                                ? ThemeColors.dark3
                                : ThemeColors.brown2,
                          ),
                        ),
                        child: Icon(
                          Icons.close,
                          size: 14.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              BottomSheetItemRow(
                title: 'Photo Library',
                icon: CupertinoIcons.photo_on_rectangle,
                onTap: () {
                  viewModel.imgFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              BottomSheetItemRow(
                title: 'Document',
                icon: CupertinoIcons.doc,
                onTap: () {
                  viewModel.pickDocument();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget image(File imageUrl) {
    return Container(
        color: Colors.white,
        width: 140,
        height: 150,
        child: Image.file(imageUrl));
  }
}
