
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Bus Stations'), actions: [
          InkWell(
            onTap: () {
              // controller.openBottomSheet();
            },
            child: Container(
                width: 50,
                alignment: Alignment.center,
                child: const Text(
                  "Filter",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                )),
          ),
          const SizedBox(
            width: 20,
          )
        ]),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Search Tech Talk',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView(
              physics: const BouncingScrollPhysics(),
              children: List.generate(
                controller.location.length,
                (index) => InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.MAP, arguments: {
                    //   'latitude': controller.location[index]['latitude'],
                    //   'longitude': controller.location[index]['longitude']
                    // });
                  },
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://cdn.vectorstock.com/i/1000x1000/97/05/bus-icon-vector-21679705.webp",
                      ),
                    ),
                    title: Text(controller.location[index]['name'].toString()),
                    subtitle: Text(
                        "${controller.location[index]['latitude']} , ${controller.location[index]['longitude']}"),
                    trailing: const Icon(
                      Icons.add,
                      size: 24.0,
                    ),
                  ).paddingOnly(top: 10),
                ),
              ),
            )),
          ],
        ).paddingSymmetric(horizontal: 20));
  }
}
