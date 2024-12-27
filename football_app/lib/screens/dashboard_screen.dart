import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dashboardcontroller.dart';
import 'package:cached_network_image/cached_network_image.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  var userListController = Get.put(DashBoardController());

  @override
  void initState() {
    userListController.getListfromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Football List Page"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Obx(() {
        if (userListController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            itemCount: userListController.teamList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: ListTile(
                    leading: SizedBox(
                      width: 100,
                      child: CachedNetworkImage(
                        fit: BoxFit.fitHeight,
                        imageUrl:
                        userListController.teamList[index].flag.toString(), placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                    title: Text(
                        "${userListController.teamList[index].name}"),
                  ),
                ),
              );
            });
      }),
    );
}

}
