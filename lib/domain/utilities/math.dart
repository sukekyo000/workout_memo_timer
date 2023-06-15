
import 'dart:math';

class MathUtilities {
  Set<int> getNotSequentialSet(Set<int> intSet, int startNum){
    Set<int> notSequentialSet = {};
    List<int> intList = intSet.toList();
    for(int i = startNum; i <= intList.reduce(max); i++){
      if(!intSet.contains(i)){
        notSequentialSet.add(i);
      }
    }
    return notSequentialSet;
  }
}