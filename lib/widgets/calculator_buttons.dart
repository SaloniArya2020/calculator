import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function fn;
  final String stg;
  final Color clr;

  const Button({required this.fn, required this.stg, required this.clr});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(5),
      height: size.height * 0.09,
      width: size.width * 0.20,
      color: clr,
      child: TextButton(
          onPressed: (){
            fn(stg);
          },
          child: Text(stg,
              style: TextStyle(
                  fontSize: 25, color: Colors.black, fontFamily: 'Open Sans', fontWeight: FontWeight.bold))),
      // child: TextButton(
      //   onPressed: (){},
      //   child: Text('1'),
      // ),
    );
  }
}
