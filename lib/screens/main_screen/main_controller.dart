import 'package:communi_assignment/models/number_object.dart';
import 'package:communi_assignment/utils/util_functions.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final UtilFunctions utilFunctions = UtilFunctions();
  final RxList<NumberObject> numbers = <NumberObject>[].obs;
  final RxnInt pressedNumber = RxnInt();

  MainController() {
    numbers.addAll(utilFunctions.buildNextNumbers(0));
  }

  //Called when the user scrolls to the end of the list
  void loadMoreNumbers() {
    numbers.addAll(
        utilFunctions.buildNextNumbers(numbers[numbers.length - 1].number));
    //As for bigger numbers, the performance will decrease, the pagination used to load the numbers in chunks
    //But fot above the number 1000000 its better to use API to get the prime numbers.
  }

  //Called when the user presses a number
  void onPressedDown(int number) {
    pressedNumber.value = number;
  }

  //Called when the user releases the number or starts scrolling
  void onPressedUp() {
    pressedNumber.value = null;
  }
}
