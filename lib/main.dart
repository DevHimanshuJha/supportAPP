import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _userInput =TextEditingController();

  static const apiKey = "AIzaSyBMEG7dm0SKzVQAPAEv8JVM0oTmTPHx2_0";

  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  final List<Message> _messages = [];

  Future<void> sendMessage() async{
    final message = _userInput.text;

    setState(() {
      _messages.add(Message(isUser: true, message: message, date: DateTime.now()));
    });

    final content = [Content.text(message)];
    final response = await model.generateContent(content);


    setState(() {
      _messages.add(Message(isUser: false, message: response.text?? "", date: DateTime.now()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
=======
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('ChatBot ',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white ),),
      ) ,
>>>>>>> fb5e41a (first commit)
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
<<<<<<< HEAD
                image: NetworkImage(''),//online image retriver
=======
                image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/765/999/824/portrait-display-vertical-artwork-digital-art-warrior-hd-wallpaper-preview.jpg'),//online image retriver
>>>>>>> fb5e41a (first commit)
                fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: ListView.builder(itemCount:_messages.length,itemBuilder: (context,index){
                  final message = _messages[index];
                  return Messages(isUser: message.isUser, message: message.message, date: DateFormat('HH:mm').format(message.date));
                })
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 15,
                    child: TextFormField(
<<<<<<< HEAD
                      style: TextStyle(color: Colors.grey),
=======
                      style: TextStyle(color: Colors.white),
>>>>>>> fb5e41a (first commit)
                      controller: _userInput,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
<<<<<<< HEAD
                          label: Text('Enter Your Message')
=======
                          label: Text('Enter Your Message',style: TextStyle(color: Colors.white),)
>>>>>>> fb5e41a (first commit)
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      padding: EdgeInsets.all(12),
                      iconSize: 30,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
<<<<<<< HEAD
                          foregroundColor: MaterialStateProperty.all(Colors.purpleAccent),
=======
                          foregroundColor: MaterialStateProperty.all(Colors.white),
>>>>>>> fb5e41a (first commit)
                          shape: MaterialStateProperty.all(CircleBorder())
                      ),
                      onPressed: (){
                        sendMessage();
                      },
                      icon: Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Message{
  final bool isUser;
  final String message;
  final DateTime date;

  Message({ required this.isUser, required this.message, required this.date});
}

class Messages extends StatelessWidget {

  final bool isUser;
  final String message;
  final String date;

  const Messages(
      {
        super.key,
        required this.isUser,
        required this.message,
        required this.date
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 15).copyWith(
          left: isUser ? 100:10,
          right: isUser ? 10: 100
      ),
      decoration: BoxDecoration(
<<<<<<< HEAD
          color: isUser ? Colors.blueAccent : Colors.grey.shade400,
=======
          color: isUser ? Colors.blueAccent : Colors.white,
>>>>>>> fb5e41a (first commit)
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: isUser ? Radius.circular(10): Radius.zero,
              topRight: Radius.circular(10),
              bottomRight: isUser ? Radius.zero : Radius.circular(10)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 16,color: isUser ? Colors.white: Colors.black),
          ),
          Text(
            date,
            style: TextStyle(fontSize: 10,color: isUser ? Colors.white: Colors.black,),
          )
        ],
      ),
    );
  }
}