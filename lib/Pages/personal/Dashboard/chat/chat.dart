import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edo/Pages/personal/Dashboard/chat/chatMessageModel.dart';
import 'package:edo/Pages/personal/Dashboard/dashboard_personal.dart';
import 'package:edo/models/user.dart';
import 'package:edo/providers/calculations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class ChatUi extends StatefulWidget {
  const ChatUi({Key? key}) : super(key: key);

  @override
  State<ChatUi> createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi> {
  var message = "";
  var groupname="Flutter";
  // List<ChatMessage> messages = [
  //   ChatMessage(messageContent: "Hello, Steve", messageType: "receiver"),
  //   ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  //   ChatMessage(messageContent: "Hey Elon, I am doing fine. wbu?", messageType: "sender"),
  //   ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  //   ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
  // ];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr?>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.indigo,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Get.to(Personal_Dashboard());
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.white,),
                  ),
                  SizedBox(width: 2,),
                  Icon(Icons.person,size: 22,color:Colors.white),

                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Books",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600,color: Colors.white),),
                        SizedBox(height: 6,),
                        Text("Online",style: TextStyle(color: Colors.white, fontSize: 13),),
                      ],
                    ),
                  ),
                  Icon(Icons.settings,color: Colors.black54,),
                ],
              ),
            ),
          ),
        ),
      body: Stack(
        children: <Widget>[

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chat')
                  .doc(user?.uid)
                  .collection('Flutter')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("");
                } else {
                  return ListView(
                      scrollDirection: Axis.vertical,
                      children: snapshot.data!.docs
                          .map((DocumentSnapshot documentSnapshot) {
                        return Stack(

                          children: [
                            Column(
                            children: [
                              SizedBox(height: 15,),

                              Align(
                                    alignment:Alignment.topRight,
                              child: Container(
                                  width: 509,
                                  decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.indigo[200],
                                          ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text('Aswin B',textAlign: TextAlign.left,),
                                        SizedBox(height: 5,),
                                        Text(
                                          documentSnapshot['message'],
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),]
                        );
                      }).toList());
                }
              },
            ),
          ),
          // ListView.builder(
          //   itemCount: messages.length,
          //   shrinkWrap: true,
          //   padding: EdgeInsets.only(top: 10,bottom: 10),
          //   physics: NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, index){
              // return Container(
              //   padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
              //   child: Align(
              //     alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.indigo[200]),
              //       ),
              //       padding: EdgeInsets.all(16),
              //       child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
              //     ),
              //   ),
              // );
            // },
          // ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                      ),
                      onChanged: (val) {
                        setState(() => message = val);
                      },
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                      Provider.of<Calculations>(context, listen: false)
                          .addtomessageData(context, {
                        'message': message,
                      });
                    },
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.indigo,
                    elevation: 0,
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}
