import 'package:flutter/material.dart';
import 'package:lelangapp/src/ui/utils/colors.dart';

class PublishLelang extends StatefulWidget {
  @override
  _PublishLelangState createState() => _PublishLelangState();
}

class _PublishLelangState extends State<PublishLelang> {
  String selectedStatus = "";
  String selectedStatusTimbangan = "";
  var _tonase = TextEditingController();
  var _size = TextEditingController();
  bool _validate = false;
  setSelectedStatus(String status) {
    setState(() {
      selectedStatus = status;
    });
  }
  setSelectedStatusTimbangan(String status) {
    setState(() {
      selectedStatusTimbangan = status;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Publish"),
        backgroundColor: colorses.hijauDasar,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12,left: 25,right: 25),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: _tonase,
                cursorColor: colorses.hijauDasar,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.line_weight),
                    labelText: 'Tonase',
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                    ),
                    hintText: 'Tonase',
                    errorStyle: TextStyle(
                        color: Colors.redAccent, fontSize: 12.0),
                    errorText:
                    _tonase.text.length < 3 && _validate
                        ? 'Tonase harus diisi!'
                        : null
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12,left: 25,right: 25),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: _size,
                cursorColor: colorses.hijauDasar,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.format_size),
                    labelText: 'Ukuran',
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                    ),
                    hintText: 'Ukuran',
                    errorStyle: TextStyle(
                        color: Colors.redAccent, fontSize: 12.0),
                    errorText:
                    _size.text.length < 3 && _validate
                        ? 'Ukuran harus diisi!'
                        : null
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              padding: const EdgeInsets.only(left:25.0),
              color: Colors.grey[300],
              height: 21,
              width: MediaQuery.of(context).size.width,
              child: Center(child: Text("Tipe Pembayaran")),
            ),
            RadioListTile(
                activeColor: colorses.hijauDasar,
                value: "cash",
                title: Text("Cash"),
                groupValue: selectedStatus,
                onChanged: (String val) {
                  setSelectedStatus(val);
                }),
            RadioListTile(
                activeColor: colorses.hijauDasar,
                value: "1",
                title: Text("1 Minggu"),
                groupValue: selectedStatus,
                onChanged: (String val) {
                  setSelectedStatus(val);
                }),
            RadioListTile(
                activeColor: colorses.hijauDasar,
                value: "2",
                title: Text("2 Minggu"),
                groupValue: selectedStatus,
                onChanged: (String val) {
                  setSelectedStatus(val);
                }),
            Container(
              padding: const EdgeInsets.only(left:25.0),
              color: Colors.grey[300],
              height: 21,
              width: MediaQuery.of(context).size.width,
              child: Center(child: Text("Timbangan")),
            ),
            RadioListTile(
                activeColor: colorses.hijauDasar,
                value: "kering",
                title: Text("Kering"),
                groupValue: selectedStatusTimbangan,
                onChanged: (String val) {
                  setSelectedStatusTimbangan(val);
                }),
            RadioListTile(
                activeColor: colorses.hijauDasar,
                value: "basah",
                title: Text("Basah"),
                groupValue: selectedStatusTimbangan,
                onChanged: (String val) {
                  setSelectedStatusTimbangan(val);
                }),
            RadioListTile(
                activeColor: colorses.hijauDasar,
                value: "hidup",
                title: Text("Hidup"),
                groupValue: selectedStatusTimbangan,
                onChanged: (String val) {
                  setSelectedStatusTimbangan(val);
                }),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
          color: colorses.hijauDasar,
          child: Center(child: Text("Publish",style: TextStyle(color: Colors.white,fontSize: 16),))),
    );
  }
}
