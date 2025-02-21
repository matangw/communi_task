import 'package:communi_assignment/screens/main_screen/main_controller.dart';
import 'package:communi_assignment/widgets/number_cell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainController mainController =
      Get.put(MainController()); //init state//dipsosed
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  // Function to load more numbers when the user scrolls to the end of the list to increase performance
  void onScroll() {
    final double maxScroll = scrollController.position.maxScrollExtent;
    final double currentScroll = scrollController.position.pixels;
    if (currentScroll >= 0.9 * maxScroll) {
      mainController.loadMoreNumbers();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: mainController.numbers.length ~/ 10,
          controller: scrollController,
          itemBuilder: (BuildContext context, int rowIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Row(
                children: List.generate(
                  10,
                  (int colIndex) {
                    final int index = rowIndex * 10 + colIndex;
                    return Expanded(
                      child: Obx(
                        () => NumberCell(
                            height: screenSize.height / 20,
                            numberObject: mainController.numbers[index],
                            onTapDown: () =>
                                mainController.onPressedDown(index),
                            onTapUp: () => mainController.onPressedUp(),
                            pressedNummber: mainController.pressedNumber.value),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
