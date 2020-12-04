import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lelangapp/src/pref/preferences.dart';
import 'package:lelangapp/src/ui/uploadetailproduk.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';
import 'package:lelangapp/src/ui/utils/customBackground.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_cropper/image_cropper.dart';

class TransaksiPage extends StatefulWidget {
  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  String tipe;
  String image;
  File imagefle;

  File imagePhoto;
  File imageKtp;
  String _imgPhoto;
  String _imgKtp;
  String id;
  String token;

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

  _openCameraKtp(BuildContext context) async {
    askPermission();
    var picture = await ImagePicker.pickImage(source: ImageSource.camera,imageQuality: 50);
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: picture.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    setState(() {
      imageKtp = croppedFile;
      print('awal');
      print(imageKtp);
      print('akhir');
    });
    Navigator.of(context).pop();
  }

  _openGalleryKtp(BuildContext context) async {
    askPermissionGallery();
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: picture.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    setState(() {
      imageKtp = croppedFile;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialogKtp(BuildContext context) {
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
                          _openGalleryKtp(context);
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
                          _openCameraKtp(context);
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
  void initState(){
    PermissionHandler().checkPermissionStatus(PermissionGroup.camera).then(_updateStatus);
    PermissionHandler().checkPermissionStatus(PermissionGroup.photos).then(_updateStatus);
    getTipe().then((value){
      if (mounted) {
        setState(() {
          tipe = value;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tipe  ==  "Petani"? AppBar(
        backgroundColor: Colors.white,
        title: Text('Upload Gambar', style: TextStyle(
          color: Colors.black
        ),),
        // bottom: PreferredSize(
        //   child: Container(
        //     // margin: EdgeInsets.all(5),
        //     // height: 40,
        //     width: MediaQuery.of(context).size.width,
        //     decoration: BoxDecoration(
        //       border: Border(
        //           top: BorderSide(
        //               color: Colors.grey
        //           )
        //       )
        //     ),
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 30,
        //           height: 30,
        //           decoration: BoxDecoration(
        //             borderRadius:  BorderRadius.circular(15),
        //             color: colorses.hijauDasar,
        //           ),
        //           child: Center(
        //             child: Text('1', style: TextStyle(color: Colors.white),),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ):AppBar(
        title: Text('Transaksi'),
      ),
      body: tipe == "Petani"?Container(
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
                          image: imagePhoto == null? AssetImage(
                              'assets/image/image-not-found.png'
                          ) : FileImage(
                            imagePhoto,
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      imagePhoto == null ?
                      _showChoiceDialogFoto(context)
                          :
                      print('ganti')
                      ;
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
              ) : Container(),
            )
          ],
        )
        ,
      ): Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: colorses.hijauDasar,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey
                  )
                ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.white54,
                //     offset: Offset(0,1),
                //     blurRadius: 2,
                //     spreadRadius: 0
                //   )
                // ]
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 12, left: 12, top: 30,bottom: 30),
                child: Text(
                  'Riwayat Transaksi',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            // Divider(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2,2),
                          blurRadius: 6,
                          spreadRadius: 0
                        )
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image/udang3.jpeg'),
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 5.0),
                          child: Text(
                            'Udang',
                            style: TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0, bottom: 5.0),
                          child: Text(
                            'Udang Merah',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                    'Durasi Pelanggan'
                                ),
                              ),
                              Container(
                                child: Text(
                                  '02 : 43 : 16',
                                  style: TextStyle(
                                      color: colorses.hijauDurasi,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                    'Harga saat ini'
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Rp. 7.500.000',
                                  style: TextStyle(
                                      color: colorses.hijauHarga,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(2,2),
                              blurRadius: 6,
                              spreadRadius: 0
                          )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image/udang4.png'),
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 5.0),
                          child: Text(
                            'Udang',
                            style: TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0, bottom: 5.0),
                          child: Text(
                            'Udang Merah',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                    'Durasi Pelanggan'
                                ),
                              ),
                              Container(
                                child: Text(
                                  '02 : 43 : 06',
                                  style: TextStyle(
                                      color: colorses.hijauDurasi,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                    'Harga saat ini'
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Rp. 7.500.000',
                                  style: TextStyle(
                                      color: colorses.hijauHarga,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )

      ,
    );
  }
}
