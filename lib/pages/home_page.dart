// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_app/components/my_drawer.dart';
import 'package:minimal_chat_app/components/my_list_tile.dart';
import 'package:minimal_chat_app/components/my_post_btn.dart';
import 'package:minimal_chat_app/components/my_textfield.dart';
import 'package:minimal_chat_app/models/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // firestore access
  final FirestoreDatabase database = FirestoreDatabase();

  //text controller
  final TextEditingController newPostController = TextEditingController();

  //post message
  void PostMessage() {
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }

    //clear the controller
    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('W A L L'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          //Textfield box for user to type
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  child: MyTextfield(
                    hintText: 'Say something...',
                    obscureText: false,
                    controller: newPostController,
                  ),
                ),

                //post btn
                MyPostBtn(onTap: PostMessage),
              ],
            ),
          ),

          //POSTS
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              // show loading circle
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              // get all posts
              final posts = snapshot.data!.docs;

              // no data?
              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text("No posts.. Post someething!"),
                  ),
                );
              }

              //return as a list
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    // Get each individual post
                    final post = posts[index];

                    // Get data from each post
                    String message = post['PostMessage'];
                    String userEmail = post['UserEmail'];
                    Timestamp timestamp = post['TimeStamp'];

                    // Convert Timestamp to DateTime
                    DateTime postDateTime = timestamp.toDate();

                    // Return as a list tile
                    return MyListTile(
                      message: message,
                      userEmail: userEmail,
                      timestamp: postDateTime,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
