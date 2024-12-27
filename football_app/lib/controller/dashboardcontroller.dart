import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/modal/DetailModal.dart';

import '../modal/FootBallModal.dart';


class DashBoardController extends GetxController{



  RxString teamname = "".obs;
  RxString flag = "".obs;
  RxString fifaCode = "".obs;
  RxString iso2 = "".obs;
  RxString emoji = "".obs;
  RxString emojiStrin = "".obs;

  RxList<Teams> teamList = <Teams>[].obs;
  var isLoading = false.obs;
  var isDetailsLoading = false.obs;

  Future<void> getListfromApi() async {
    isLoading.value = true;
    try {
      var url = Uri.parse("https://myfakeapi.com/api/football/teams");

      var response = await http.get(url);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        isLoading.value = false;
        teamList.value = FootBallModal.fromJson(jsonDecode(response.body)).teams!.toList();
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          "User list api not responding",
          snackPosition: SnackPosition.BOTTOM,
          forwardAnimationCurve: Curves.elasticInOut,
          reverseAnimationCurve: Curves.easeOut,
        );
      }
    } catch (error,exception) {
      isLoading.value = false;
      debugPrint(exception.toString());
      Get.snackbar(
        'Exception - ',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
    }
  }

/*  Future<void> getDetailsListfromApi(id) async {
    isDetailsLoading.value = true;
    try {
      var url = Uri.parse( "https://myfakeapi.com/api/football/teams/$id");

      var response = await http.get(url);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        teamname.value = DetailsModal.fromJson(jsonDecode(response.body)).team!.name.toString();
        flag.value = DetailsModal.fromJson(jsonDecode(response.body)).team!.flag.toString();
        fifaCode.value = DetailsModal.fromJson(jsonDecode(response.body)).team!.fifaCode.toString();
        iso2.value = DetailsModal.fromJson(jsonDecode(response.body)).team!.iso2.toString();
        emojiStrin.value = DetailsModal.fromJson(jsonDecode(response.body)).team!.emojiString.toString();
        emoji.value = DetailsModal.fromJson(jsonDecode(response.body)).team!.emoji.toString();
        isDetailsLoading.value = false;

      } else {
        isDetailsLoading.value = false;
        Get.snackbar(
          'Error',
          "User list api not responding",
          snackPosition: SnackPosition.BOTTOM,
          forwardAnimationCurve: Curves.elasticInOut,
          reverseAnimationCurve: Curves.easeOut,
        );
      }
    } catch (error,exception) {
      isDetailsLoading.value = false;
      debugPrint(exception.toString());
      Get.snackbar(
        'Exception - ',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
    }
  }*/
}