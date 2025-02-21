import 'package:communi_assignment/models/number_object.dart';

class UtilFunctions {
  //Builds the next 1000 numbers starting from the given number
  List<NumberObject> buildNextNumbers(int startingNumber) {
    List<NumberObject> nextNumbers = [];
    for (int i = startingNumber; i < startingNumber + 1000; i++) {
      nextNumbers.add(NumberObject(number: i));
    }
    return nextNumbers;
  }
}
