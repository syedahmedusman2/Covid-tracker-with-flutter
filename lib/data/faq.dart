import 'package:covid/data/datasource.dart';
import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs"),
        backgroundColor: Colors.black38,
      ),
      body: ListView.builder(
          itemCount: Datasource.questionAnswers.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                Datasource.questionAnswers[index]['question'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(Datasource.questionAnswers[index]['answer']),
                )
              ],
            );
          }),
    );
  }
}
