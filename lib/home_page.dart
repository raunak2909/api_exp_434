import 'dart:convert';

import 'package:api_exp_434/model/quote_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QuoteModel> mQuotes = [];

  @override
  void initState() {
    super.initState();
    getAllQuotes();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Quotes')),
      body: mQuotes.isNotEmpty
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
          : Center(child: Text('No Quotes yet!!')),
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
}
