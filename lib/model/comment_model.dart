class DataCommentModel {
  int limit;
  int skip;
  int total;
  List<CommentModel> comments;

  DataCommentModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.comments,
  });

  factory DataCommentModel.fromJson(Map<String, dynamic> json){

    List<CommentModel> mComments = [];

    for(Map<String, dynamic> eachMap in json['comments']){
      mComments.add(CommentModel.fromJson(eachMap));
    }

    return DataCommentModel(
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
        comments: mComments);
  }
}

class CommentModel {
  String body;
  int id;
  int likes;
  int postId;
  UserModel user;

  CommentModel({
    required this.id,
    required this.body,
    required this.likes,
    required this.postId,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      body: json['body'],
      likes: json['likes'],
      postId: json['postId'],
      user: UserModel.fromJson(json['user']),
    );
  }
}

class UserModel {
  int id;
  String username;
  String fullName;

  UserModel({required this.id, required this.username, required this.fullName});

  ///fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      fullName: json['fullName'],
    );
  }
}
