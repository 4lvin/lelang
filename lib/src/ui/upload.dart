
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lelangapp/src/ui/uploadetailproduk.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File imagePhoto;
  String _imgPhoto;

  PermissionStatus permissionCamera;
  PermissionStatus permissionGallery;

  void _updateStatus(PermissionStatus permissionStatus){
    if(permissionStatus != permissionCamera){
      setState(() {
        permissionCamera = permissionStatus;
      });
    }
  }
  void _updateStatusGallery(PermissionStatus permissionStatus){
    if(permissionStatus != permissionGallery){
      setState(() {
        permissionGallery = permissionStatus;
      });
    }
  }

  void askPermissionGallery(){
    PermissionHandler().requestPermissions([PermissionGroup.photos]).then(_onStatusRequestedGallery);
  }


  void askPermission(){
    PermissionHandler().requestPermissions([PermissionGroup.camera]).then(_onStatusRequested);
  }

  void _onStatusRequested(Map<PermissionGroup,PermissionStatus> statuses){
    final status = statuses[PermissionGroup.camera];
    if(status != PermissionStatus.granted){
      PermissionHandler().openAppSettings();
    }else{
      _updateStatus(status);
    }
  }

  void _onStatusRequestedGallery(Map<PermissionGroup,PermissionStatus> statuses){
    final status = statuses[PermissionGroup.photos];
    if(status != PermissionStatus.granted){
      PermissionHandler().openAppSettings();
    }else{
      _updateStatusGallery(status);
    }
  }

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery,imageQuality: 50);
    setState(() {
      imagePhoto = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera,imageQuality: 50);
    setState(() {
      imagePhoto = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialogFoto(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff740e13),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 9.0,
                            ),
                          ]),
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: 12),
                      child: Center(
                          child: Text(
                            "Pilih Aksi",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.photo,
                                size: 60,
                                color: Colors.grey,
                              ),
                              Text("Gallery"),
                            ],
                          ),
                        ),
                        onTap: () {
                          _openGallery(context);
                        },
                      ),
                      Padding(padding: EdgeInsets.all(8.0)),
                      GestureDetector(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 60,
                                  color: Colors.grey,
                                ),
                              ),
                              Text("Kamera"),
                            ],
                          ),
                        ),
                        onTap: () {
                          _openCamera(context);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
            'Upload Gambar',
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, right: 5, left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                      child: Center(
                        child: Image(
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.25,
                          image: imagePhoto ==  null?AssetImage(
                              'assets/image/image-not-found.png'
                          ):FileImage(
                            imagePhoto,
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      imagePhoto == null?
                      _showChoiceDialogFoto(context):null;
                    },
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: imagePhoto != null ? Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(25),
                  color: colorses.hijauDasar,
                ),
                child: Material(
                  borderRadius:  BorderRadius.circular(25),
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.green,
                    borderRadius:  BorderRadius.circular(25),
                    onTap: (){
                      List<int> imageBytesPhoto = imagePhoto.readAsBytesSync();
                      _imgPhoto = base64Encode(imageBytesPhoto);
                      Navigator.push(
                          context,
                          PageTransition(
                              child: UpProDetail(image:_imgPhoto),
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 200)
                          )
                      );
                    },
                    child: Center(
                        child: new Icon(Icons.keyboard_arrow_right, color: Colors.white,)
                    ),
                  ),
                ),
              ): null,
            )
          ],
        ),
      ),
    );
  }
}
