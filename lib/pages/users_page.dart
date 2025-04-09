// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_app/components/my_back_button.dart';
import 'package:minimal_chat_app/components/user_tile.dart';
import 'package:minimal_chat_app/helper/helper_function.dart';
import 'package:minimal_chat_app/pages/chat_page.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/services/chat/chat_service.dart';

class UsersPage extends StatelessWidget {
  UsersPage({super.key});

  // Chat && auth Service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // Build a list of users except for the current logged-in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // Error
        if (snapshot.hasError) {
          displayMessageToUser("Something went wrong", context);
          return const Text("Error");
        }

        // Loading...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // Return list view
        return ListView(
          padding: const EdgeInsets.all(0),
          children:
              snapshot.data!
                  .map<Widget>(
                    (userData) => _buildUserListItem(userData, context),
                  )
                  .toList(),
        );
      },
    );
  }

  // Build individual list item
  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    final currentUser = _authService.getCurrentUser();
    if (currentUser != null && userData['email'] != currentUser.email) {
      return UserTile(
        username: userData['username'] ?? 'No Username',
        email: userData['email'],
        onTap: () {
          // Tapped on a user -> go to chat page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => ChatPage(
                    receiverEmail: userData["email"],
                    receiverID: userData["uid"],
                  ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Back button
          const Padding(
            padding: EdgeInsets.only(top: 50, left: 25),
            child: Row(children: [MyBackButton()]),
          ),
          const SizedBox(height: 25),

          // List of users
          Expanded(child: _buildUserList()),
        ],
      ),
    );
  }
}
