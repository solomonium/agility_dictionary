import 'package:agility_flutter_form/view_model/word_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController wordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final dictionaryWord = Provider.of<DictionaryViewWordModel>(context);
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text('Words Definition',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        backgroundColor: Colors.pinkAccent.withOpacity(0.3),
      ),
      body: Form(
        key: formKey,
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: wordController,
                decoration: InputDecoration(
                    hintText: 'Enter a word',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Username';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    dictionaryWord.getWordMeaning(wordController.text);

                    // setState(() {
                    //   name = username.text;

                    // });
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent),
                child: Text('Get meaning'),
              ),
            ),
            SizedBox(height: 40),
            Text('Word: ${wordController.text}',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(height: 30),
            Text(
              'Definition: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: dictionaryWord.isLoading
                  ? CircularProgressIndicator()
                  : dictionaryWord.wordModel == null
                      ? Text('No data found')
                      : dictionaryWord.errorMessage.isNotEmpty
                          ? Text(dictionaryWord.errorMessage)
                          : Text(
                              dictionaryWord.wordModel?.meanings?[0]
                                      .definitions?[0].definition ??
                                  '',
                              style: TextStyle(fontSize: 20)),
            ),
          ],
        )),
      ),
    );
  }
}
