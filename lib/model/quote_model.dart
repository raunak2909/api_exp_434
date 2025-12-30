class QuoteDataModel {
  int total;
  int limit;
  int skip;
  List<QuoteModel> quotes;

  QuoteDataModel({
    required this.limit,
    required this.skip,
    required this.total,
    required this.quotes,
  });

  factory QuoteDataModel.fromJson(Map<String, dynamic> json){

    List<QuoteModel> mQuotes = [];

    for(Map<String, dynamic> eachMap in json['quotes']){
      mQuotes.add(QuoteModel.fromJson(eachMap));
    }

    return QuoteDataModel(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        quotes: mQuotes);
  }
}

class QuoteModel {
  int id;
  String quote;
  String author;

  QuoteModel({required this.id, required this.quote, required this.author});

  ///fromJson
  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json["id"],
      quote: json["quote"],
      author: json["author"],
    );
  }
}
