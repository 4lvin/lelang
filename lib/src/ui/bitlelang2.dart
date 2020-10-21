
import 'package:flutter/material.dart';

class BitLelang2 extends StatefulWidget {
  BitLelang2({this.a});
  String a;
  @override
  _BitLelang2State createState() => _BitLelang2State();
}

class _BitLelang2State extends State<BitLelang2> {
  @override
  void initState(){
    
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.a),
      ),
    );
  }
}
