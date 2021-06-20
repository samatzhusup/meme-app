import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytest/view/detailView.dart';
import 'package:mytest/widget/budge.dart';

class SearchItem extends StatelessWidget {
  final List searchModel;
  final int i;

  const SearchItem({Key key, this.searchModel,this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: GestureDetector(
        onTap: () => Get.to(RepositoryDetailPage(searchModel: searchModel,i:i)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                searchModel[i].avatarUrl,
              ),
            ),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              searchModel[i].name,maxLines: 1,overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              searchModel[i].owner,maxLines: 1,overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          BudgeColumn(
                            icon: Icons.stars,
                            count: searchModel[i].stars,
                            color: Colors.amber,
                          ),
                          BudgeColumn(
                            icon: Icons.call_split,
                            count: searchModel[i].forks,
                            color: Colors.blue,
                          ),
                          BudgeColumn(
                            icon: Icons.remove_red_eye,
                            count: searchModel[i].watchers,
                            color: Colors.pink,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
