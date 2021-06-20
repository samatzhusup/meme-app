import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytest/model/searchModel.dart';
import 'package:mytest/repository/searchRepository.dart';

class SearchController extends GetxController {

  SearchRepository searchRepository;
  SearchModel searchModel;

  RxBool apiBusy = false.obs;

  final repoLov = TextEditingController().obs;
  RxList listRepos = [].obs;

  SearchController() {
    searchRepository = SearchRepository();
  }

  Future<List> getRepos(String token) async {
    searchModel = await searchRepository.repos(token);
    apiBusy.value = true;
    await Future.delayed(new Duration(milliseconds: 1500)); // для просмотра CircularProgressIndicator
    if (searchModel == null) {
      Get.snackbar(
        'Ошибка',
        'Не удалось установить соединение API, проверьте.',
        icon: Icon(Icons.report),
        shouldIconPulse: true,
        barBlur: 50,
        isDismissible: false,
        margin: EdgeInsets.all(8),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
      );
      apiBusy.value = false;
    } else {
      apiBusy.value = false;

      if (searchModel.totalCount > 0) {

        listRepos.assignAll(searchModel.items);
      } else {
        Get.snackbar(
          'Repository не найден.',
          'попробуйте искать по-другому',
          icon: Icon(Icons.report_problem),
          shouldIconPulse: true,
          barBlur: 50,
          isDismissible: false,
          margin: EdgeInsets.all(8),
          backgroundColor: Colors.yellow, // redAccent,
          colorText: Colors.white,
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
        );
        apiBusy.value = false;
      }
    }
    return searchModel.items;
  }
}
