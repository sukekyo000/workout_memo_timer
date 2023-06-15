
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_use/flutter_use.dart';

class ValidateUtilities {
  /// check String is Empty or Double
  bool checkIntOrEmpty(String string){
    try{
      int.parse(string);
    } catch (e) {
      if(string.isEmpty) return true;
      return false;
    }
    return true;
  }
  /// check String is int or Double
  bool checkDoubleOrEmpty(String string){
    try{
      double.parse(string);
    } catch (e) {
      if(string.isEmpty) return true;
      return false;
    }
    return true;
  }
  /// check two controllers are not Empty
  bool checkTwoTextEditingControllerAreNotEmpty(TextEditingController firstController, TextEditingController secondController){
    if(firstController.text.isEmpty && secondController.text.isEmpty){
      return true;
    } else {
      return false;
    }
  }
  /// check int set is sequential
  bool checkIntSetIsSequential(Set<int> numberSet){
    List<int> numberList = numberSet.toList();
    numberList.sort();
    for(int i = 0; i < numberList.length; i++){
      if(i + 1 != numberList[i]){
        return false;
      }
    }
    return true;
  }
  /// validate weightController and repController in one line are correct
  String validateWeightAndRepAreCorrect(int set, TextEditingController weightController, TextEditingController repController, ToggleState supportState){
    if(weightController.text.isEmpty && repController.text.isNotEmpty){
      return "$setセット目の重さが記入されていません";
    } else if (weightController.text.isNotEmpty && repController.text.isEmpty){
      return "$setセット目の回数が記入されていません";
    } else if (weightController.text.isEmpty && repController.text.isEmpty && supportState.value){
      return "$setセット目の重さ・回数が記入されていません";
    } else {
      return "";
    }
  }

  /// check Both of weightController and repController are empty
  bool checkWeightAndRepAreEmpty(TextEditingController weightController, TextEditingController repController){
    if(weightController.text.isEmpty && weightController.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  /// calculate how many sets form have
  int calculateHomeManySetFormHave(List<TextEditingController> weightControllerList, List<TextEditingController> repControllerList){
    Set<int> isNotEmptySetNum = {};
    for(int i = 0; i < 5; i++){
      bool isEmpty = checkWeightAndRepAreEmpty(weightControllerList[i], repControllerList[i]);
      if(!isEmpty) isNotEmptySetNum.add(i+1);
    }
    return isNotEmptySetNum.toList().reduce(max);
  }
}