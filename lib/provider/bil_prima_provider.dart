import 'package:flutter/material.dart';

class BilPrimaProvider extends ChangeNotifier{
  final computationController = TextEditingController();

  setValue(String value){
    String str = computationController.text;

    switch(value){
      case "C":
        computationController.clear();
        // computationController.text = str.substring(0, str.length - 1);
        break;
      case "check":
        checkNumber();
        break;
      default:
        computationController.text += value;
    }
  }

  void checkNumber() {
    String text = computationController.text;
    int number = int.tryParse(computationController.text) ?? 0;

    if (number <= 1) {
      computationController.text = 'Bukan Prima';
    } else {
      bool isPrime = true;
      for (int i = 2; i <= number / 2; i++) {
        if (number % i == 0) {
          isPrime = false;
          break;
        }
      }
      if (isPrime) {
        computationController.text = 'Prima';
      } else {
        computationController.text = 'Bukan Prima';
      }
    }
    notifyListeners();
  }


  @override
  void dispose() {
    super.dispose();
    computationController.dispose();
  }
}