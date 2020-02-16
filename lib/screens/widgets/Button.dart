import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  int _i, _j;
  String _buttonText = '';
  Function _fn;
  Button({int i , int j, String buttonText, Function fn}){
    this._i = i;
    this._j = j;
    this._buttonText = buttonText;
    this._fn = fn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: RaisedButton(
        padding: EdgeInsets.all(15),
        elevation: 10,
        color: Colors.lightBlue,
        onPressed: () {
          _fn(_i, _j);
        },
        child: Text(
          _buttonText ?? '',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
