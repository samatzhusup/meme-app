import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class RepositoryDetailPage extends StatelessWidget {
  final List searchModel;
  final int i;

  RepositoryDetailPage({this.searchModel, this.i});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(this.searchModel[i].name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80.0,
                      backgroundImage:
                          NetworkImage(this.searchModel[i].avatarUrl),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        this.searchModel[i].owner,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      _buildBadgeItem(Icons.stars, Colors.amber,
                          this.searchModel[i].stars.toString()),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildBadgeItem(Icons.call_split, Colors.blueAccent,
                          this.searchModel[i].forks.toString()),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildBadgeItem(Icons.remove_red_eye, Colors.pink,
                          this.searchModel[i].watchers.toString()),
                    ],
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.blueAccent,
              height: 2.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              this.searchModel[i].description,
              style: TextStyle(fontSize: 20.0),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  _buildRowDetail("Язык", this.searchModel[0].language),
                  SizedBox(
                    height: 16.0,
                  ),
                  _buildRowDetail(
                      "Создано",
                      formatDate(this.searchModel[0].createdAt,
                          [dd, '/', mm, '/', yyyy])),
                  SizedBox(
                    height: 16.0,
                  ),
                  _buildRowDetail(
                      "Обновлено",
                      formatDate(this.searchModel[i].updatedAt,
                          [dd, '/', mm, '/', yyyy])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowDetail(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w200),
        ),
        Text(
          value,
        ),
      ],
    );
  }

  Widget _buildBadgeItem(IconData iconData, Color iconColor, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontSize: 30.0, color: Colors.teal),
        ),
        SizedBox(width: 20.0),
        Icon(
          iconData,
          size: 40.0,
          color: iconColor,
        )
      ],
    );
  }
}
