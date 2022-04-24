import 'package:flutter/material.dart';
import 'package:simple_calculator/constants.dart';
import 'package:simple_calculator/widgets/calculator_buttons.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int? firstNum;
  int? secondNum;
  String? result;
  String textToDisplay = '';
  String history = '';
  String sign = '';
  String? operation;

  void btnOnClick(String btnVal){
    if(btnVal == 'AC'){
      firstNum = 0;
      secondNum = 0;
      result = '';
      textToDisplay ='';
      history = '';
      sign = '';
    }else if(btnVal == '+/-'){
      if(textToDisplay[0] != '-'){
        result = '-'+ textToDisplay;
      }else{
        result = textToDisplay.substring(1);
      }
    }else if(btnVal=='<'){
      result = textToDisplay.substring(0, textToDisplay.length-1);
    }
    else if( btnVal == '%' || btnVal == '/' || btnVal == 'x'|| btnVal == '-'|| btnVal == '+'){

      firstNum = int.parse(textToDisplay);
      result = '';
      sign = btnVal.toString();
      operation = btnVal;


    }else if(btnVal == '='){
      secondNum = int.parse(textToDisplay);
      sign = '';

      if(operation == '+'){
        result =(firstNum! + secondNum!).toString();

        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation == '+'){
        result =(firstNum! + secondNum!).toString();

        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation == '-'){
        result =(firstNum! - secondNum!).toString();

        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation == 'x'){
        result =(firstNum! * secondNum!).toString();

        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation == '/'){
        result =(firstNum! / secondNum!).toString();

        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation == '%'){
        result =(firstNum! * secondNum!/100).toString();

        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
    }else{
      result = (textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = result.toString();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculator'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.centerRight,
            child: Text(history, style: TextStyle(fontSize: 20, color: Colors.grey[600]),),
          ),

          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(sign, style: TextStyle(fontSize: 40, color: Colors.grey[800]),),
                Text(textToDisplay, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.grey[800]),),
              ],
            ),
          ),

          Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(fn: btnOnClick, stg: 'AC', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '<', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '%', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '/', clr: Colors.grey[600]!,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(fn: btnOnClick, stg: '7', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '8', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '9', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: 'x', clr:  Colors.grey[600]!,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(fn: btnOnClick, stg: '4', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '5', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '6', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '-', clr:  Colors.grey[600]!,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(fn: btnOnClick, stg: '1', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '2', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '3', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '+', clr: Colors.grey[600]!,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(fn: btnOnClick, stg: '+/-', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '0', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '00', clr: Colors.grey[400]!,),
              Button(fn: btnOnClick, stg: '=', clr: Colors.red[300]!,),
            ],
          ),

        ],
      ),
    );
  }
}
