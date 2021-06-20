class SearchModel {
  int totalCount;
  bool incompleteResults;
  List<SearchData> items;

  SearchModel({this.totalCount, this.incompleteResults, this.items});

  SearchModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(SearchData.fromJson(v));
      });
    }
  }
}

class SearchData {
  int id;
  String nodeId;
  String name;
  String description;
  String owner;
  String avatarUrl;
  int forks;
  int stars;
  int watchers;
  DateTime createdAt;
  DateTime updatedAt;
  String url;
  String language;


  SearchData({
    this.id,
    this.nodeId,
    this.name,
    this.description,
    this.owner,
    this.avatarUrl,
    this.forks,
    this.stars,
    this.watchers,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.language
  });

  SearchData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name= json["name"];
    description= json["description"];
    owner=json["owner"]["login"];
    avatarUrl= json["owner"]["avatar_url"];
    stars= json["stargazers_count"];
    forks= json["forks_count"];
    watchers= json["watchers_count"];
    createdAt= DateTime.parse(json["created_at"]);
    updatedAt= DateTime.parse(json["updated_at"]);
    url= json["html_url"];
    language= json["language"];
  }
}
