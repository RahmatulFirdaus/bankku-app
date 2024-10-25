import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id_camp_final_project/pages/home_page.dart';
import 'package:id_camp_final_project/pages/my_card_page.dart';
import 'package:id_camp_final_project/pages/settings_page.dart';
import 'package:id_camp_final_project/pages/statistics.dart';

class Getxcontrollerpage extends StatefulWidget {
  const Getxcontrollerpage({super.key});

  @override
  State<Getxcontrollerpage> createState() => _GetxcontrollerpageState();
}

class _GetxcontrollerpageState extends State<Getxcontrollerpage> {
  final NavigationController _navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    //Obx merupakan bagian dari GetX yang berfungsi untuk memantau perubahan reaktif dari class navigation Controller, ketika selected index berubah, maka tampilan juga akan berubah
    return Obx(() => Scaffold(
        body: _navController.screen[_navController.selectedIndex.value],

        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          selectedIndex: _navController.selectedIndex.value,
          onDestinationSelected: (index) {
            _navController.updateIndex(index);
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person), label: "My Cards"),
            NavigationDestination(icon: Icon(Icons.analytics), label: "Statistics"),
            NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
          ],
        )));
  }
}

//merupakan sebuah class yang menyimpan dan mengelola indeks halaman dengan getx
class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final List<Widget> screen = [
    const Homepage(),
    const Mycard(),
    const Statisticspage(),
    const Settingspage(),
  ];

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}