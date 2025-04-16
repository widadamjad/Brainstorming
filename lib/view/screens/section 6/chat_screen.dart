import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:foodtek/view/screens/section%203/favorites_screen.dart';
import 'package:foodtek/view/screens/section%203/home_screen.dart';
import 'package:foodtek/view/screens/section%204/delete_cart_screen.dart';
import 'package:foodtek/view/screens/section%204/history_screen.dart';
import 'package:foodtek/view/screens/section%206/profile_screen.dart';
import 'package:foodtek/view/screens/section%206/track_location_screen.dart';

import '../../widgets/bottom_nav_Item_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // bottom‑nav state
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() => selectedIndex = index);
  }

  // chat messages
  final List<Map<String, String>> messages = [
    {"text": "Hello chatGPT, how are you today?", "sender": "user"},
    {"text": "Hello, I'm fine, how can I help you?", "sender": "bot"},
    {"text": "What is the best programming language?", "sender": "user"},
    {
      "text":
      "There are many programming languages in the market that are used in designing and building websites, various applications and other tasks. All these languages are popular in their place and in the way they are used, and many programmers learn and use them.",
      "sender": "bot"
    },
    {"text": "So explain to me more", "sender": "user"},
    {
      "text":
      "There are many programming languages in the market that are used in designing and building websites, various applications and other tasks. All these languages are popular in their place and in the way they are used, and many programmers learn and use them.",
      "sender": "bot"
    },
  ];

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.chat),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Container(height: 1, color: Colors.grey.shade300),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              itemCount: messages.length,
              reverse: false,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final bool isUser = msg['sender'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.green : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      msg['text']!,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding:  EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.write_your_message,
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.green,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                    onPressed: () {
                      if (_controller.text.trim().isEmpty) return;
                      setState(() {
                        messages.add({'text': _controller.text.trim(), 'sender': 'user'});
                        _controller.clear();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItemWidget(
                icon: Icons.home,
                label: AppLocalizations.of(context)!.home,
                isSelected: selectedIndex == 0,
                onTap: () {
                  onItemTapped(0);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
                },
              ),
              BottomNavItemWidget(
                icon: Icons.favorite,
                label: AppLocalizations.of(context)!.favorite,
                isSelected: selectedIndex == 1,
                onTap: () {
                  onItemTapped(1);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const FavoritesScreen()));
                },
              ),
              const SizedBox(width: 40),
              BottomNavItemWidget(
                icon: Icons.home_work,
                label: AppLocalizations.of(context)!.track,
                isSelected: selectedIndex == 3,
                onTap: () {
                  onItemTapped(3);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const TrackLocationScreen()));
                },
              ),
              BottomNavItemWidget(
                icon: Icons.person,
                label: AppLocalizations.of(context)!.profile,
                isSelected: selectedIndex == 4,
                onTap: () {
                  onItemTapped(4);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DeleteCartScreen())),
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
