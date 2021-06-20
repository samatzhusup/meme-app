import 'package:get/get.dart';
import 'package:mytest/controller/searchController.dart';


class SearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
  }
}
