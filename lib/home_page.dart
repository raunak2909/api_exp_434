import 'dart:convert';

import 'package:api_exp_434/model/comment_model.dart';
import 'package:api_exp_434/model/quote_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QuoteModel> mQuotes = [];
  List<CommentModel> mComments = [];

  @override
  void initState() {
    super.initState();
    //getAllQuotes();
    getAllComments();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Quotes')),
      body: mComments.isNotEmpty ? ListView.builder(
        itemCount: mComments.length,
          itemBuilder: (_, index){
        return ListTile(
          leading: Text(mComments[index].user.id.toString()),
          title: Text(mComments[index].user.fullName),
          subtitle: Text(mComments[index].body),
        );
      }) : Center(
        child: Text('No Comments yet!!'),
      ),
      /*body: mQuotes.isNotEmpty
          ? ListView.builder(
        itemCount: mQuotes.length,
          itemBuilder: (_, index){
            return Card(
              child: ListTile(
                title: Text(mQuotes[index].quote),
                subtitle: Text(" - ${mQuotes[index].author}"),
              ),
            );
      })
          : Center(child: Text('No Quotes yet!!')),*/
    );
  }

  void getAllQuotes() async {
    String url = "https://dummyjson.com/quotes";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print("res: ${response.body}");

      dynamic data = jsonDecode(response.body);
      mQuotes = QuoteDataModel.fromJson(data).quotes;
      setState(() {

      });
    }
  }

  void getAllComments() async {
    String url = "https://dummyjson.com/comments";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print("res: ${response.body}");

      dynamic data = jsonDecode(response.body);
      mComments = DataCommentModel.fromJson(data).comments;
      setState(() {

      });
    }
  }
}
