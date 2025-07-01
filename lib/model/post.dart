class Post {
  int? albumId;
  int? id;
  String? title;
  String? body;
  String? thunbnailUrl;

  Post({this.albumId, this.id, this.title, this.body, this.thunbnailUrl});

  //  Post.fromJson .
  // This method will map the JSON keys into our model class’s fields.
  Post.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    thunbnailUrl = json['thunbnaillUrl'];
  }
}
