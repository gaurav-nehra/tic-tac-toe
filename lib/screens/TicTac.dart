import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/widgets/Button.dart';
import 'package:tic_tac_toe/screens/widgets/Result.dart';

class TicTac extends StatefulWidget {
  @override
  _TicTacState createState() => _TicTacState();
}

class _TicTacState extends State<TicTac> {
  // winner result
  String _result = "";
  // false for X, true for O
  bool flag = false;
  // to count number of moves
  int _moveCount = 0;
  // 2D-array to assign coordinates to every button
  List<List<String>> arr = [
    [null, null, null],
    [null, null, null],
    [null, null, null],
  ];

  // decides player move and sets it
  _move(int i, int j) {
    if(flag == false && arr[i][j] == null) {
      arr[i][j] = 'X';
      flag = true;
      ++_moveCount;
    }
    else if(flag == true && arr[i][j] == null) {
      arr[i][j] = 'O';
      flag = false;
      ++_moveCount;
    }

    //print(arr);
    if(_moveCount >= 5) {
      _checkWinner();
    }

    setState(() {

    });

  }

  // checks if a player won
  _checkWinner() {

    // for rows
    for(int i = 0; i < 3; i++) {
      if(arr[i][0] != null) {
        if(arr[i][0] == arr[i][1] && arr[i][0] == arr[i][2]) {
          _result = '${arr[i][0]} WON in Row ${i+1}';
          break;
        }
      }
    }

    // for columns
    for(int j = 0; j < 3; j++) {
      if(arr[0][j] != null) {
        if(arr[0][j] == arr[1][j] && arr[0][j] == arr[2][j]) {
          _result = '${arr[0][j]} WON in Column ${j+1}';
          break;
        }
      }
    }

    // for 1 diagonal
    if(arr[0][0] == arr[1][1] && arr[0][0] == arr[2][2] && arr[0][0] != null) {
      _result = '${arr[0][0]} WON in Diagonal';
    }

    //for 2 diagonal
    if(arr[2][0] == arr[1][1] && arr[2][0] == arr[0][2] && arr[2][0] != null) {
      _result = '${arr[2][0]} WON in Diagonal';
    }

    //for draw
    if(_moveCount >= 9) {
      bool draw = false;
      for(int m = 0; m < 3; m++) {
        for(int n = 0; n < 3; n++) {
          if(arr[m][n] != null) {
            draw = true;
            break;
          }
        }
      }
      if(draw) {
        _result = 'Draw';
      }
    }
  }

  // to reset game
  //giving arguments because function call in button is passing arguments
  _reset(x, y) {
    // setting every value to starting value/null

    _result = "";
    flag = false;
    _moveCount = 0;

    arr = [
      [null, null, null],
      [null, null, null],
      [null, null, null],
    ];

    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Tic Tac Toe',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Button(
                  i: 0,
                  j: 0,
                  buttonText: arr[0][0],
                  fn: _move,
                ),
                Button(
                    i: 0,
                    j: 1,
                    buttonText: arr[0][1],
                    fn: _move,
                ),
                Button(
                  i: 0,
                  j: 2,
                  buttonText: arr[0][2],
                  fn: _move,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Button(
                  i: 1,
                  j: 0,
                  buttonText: arr[1][0],
                  fn: _move,
                ),
                Button(
                  i: 1,
                  j: 1,
                  buttonText: arr[1][1],
                  fn: _move,
                ),
                Button(
                  i: 1,
                  j: 2,
                  buttonText: arr[1][2],
                  fn: _move,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Button(
                  i: 2,
                  j: 0,
                  buttonText: arr[2][0],
                  fn: _move,
                ),
                Button(
                  i: 2,
                  j: 1,
                  buttonText: arr[2][1],
                  fn: _move,
                ),
                Button(
                  i: 2,
                  j: 2,
                  buttonText: arr[2][2],
                  fn: _move,
                ),
              ],
            ),
            Result(_result),
            Container(
              child: Button(
                buttonText: 'Reset',
                fn: _reset,
              ),
            )
          ],
        ),

      ),
    );
  }
}
