import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytest/controller/searchController.dart';
import 'package:mytest/widget/search_item.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    List user = [];
    // RxBool favorite = false.obs;

    return Scaffold(
      appBar: AppBar(title: Text('GitHub Repo')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Obx(() {
                user = controller.listRepos.toList();
                return Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 15.0),
                            controller: controller.repoLov.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Введите данные запроса здесь',
                              labelStyle: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            if (controller.repoLov.value.text == null ||
                                controller.repoLov.value.text == '') {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              Get.snackbar(
                                'Внимание',
                                'Нет информации для поиска. Проверять.',
                                icon: Icon(Icons.report_problem),
                                shouldIconPulse: true,
                                barBlur: 50,
                                isDismissible: false,
                                margin: EdgeInsets.all(8),
                                backgroundColor: Colors.blue,
                                // redAccent,
                                colorText: Colors.yellow,
                                duration: Duration(seconds: 5),
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              user = await controller
                                  .getRepos(controller.repoLov.value.text);
                            }
                          },
                          icon: Icon(Icons.search),
                          label: Text('Поиск'),
                        ),
                        (controller.apiBusy.value == true)
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Container(
                                // height: 950.0,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: user.length,
                                    itemBuilder: (context, i) {
                                      return SearchItem(
                                          searchModel: user, i: i);
                                    }),
                              ),
                      ],
                    )
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
