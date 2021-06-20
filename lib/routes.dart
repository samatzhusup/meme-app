import 'package:get/route_manager.dart';
import 'package:mytest/binding/searchBindings.dart';
import 'package:mytest/view/searchView.dart';

class Routes {
  static const SEARCH = '/';
  static const APIURL = 'https://api.github.com/search/repositories';
}

class Pages {
  static List<GetPage> pages = [
    GetPage(name: Routes.SEARCH, page: () => SearchView(), binding: SearchBindings()),
  ];
}
