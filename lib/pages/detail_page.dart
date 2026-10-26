import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  final String contactName;

  const ChatScreen({super.key, required this.contactName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Penjual',
      'message': 'Gc mau beli kaga nih, lagi diskon!!',
      'isMe': false,
    },
    {'text': 'You', 'message': 'Thx buat informasinya yee!', 'isMe': true},
    {'text': 'Penjual', 'message': 'YUpppp amannn aja', 'isMe': false},
  ];

  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late final Future<void> _messagesReady;

  @override
  void initState() {
    super.initState();
    _messagesReady = _loadMessages();
  }

  String get _messageStorageKey => 'chat_messages_${widget.contactName}';

  Future<void> _loadMessages() async {
    final preferences = await SharedPreferences.getInstance();
    final savedMessages = preferences.getString(_messageStorageKey);
    if (savedMessages != null) {
      final decodedMessages = jsonDecode(savedMessages) as List<dynamic>;
      final loadedMessages = decodedMessages
          .map((message) => Map<String, dynamic>.from(message as Map))
          .toList();
      if (!mounted) return;
      setState(() {
        messages
          ..clear()
          ..addAll(loadedMessages);
      });
    }
  }

  Future<void> _sendMessage() async {
    await _messagesReady;
    if (!mounted) return;
    final messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        messages.add({'text': 'You', 'message': messageText, 'isMe': true});
      });
      _messageController.clear();
      final preferences = await SharedPreferences.getInstance();
      await preferences.setString(_messageStorageKey, jsonEncode(messages));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.contactName)),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          final isMe = message['isMe'] == true;
          return ListTile(
            title: Align(
              alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isMe
                      ? const Color(0xff17191c)
                      : const Color(0xfff1f3f5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  message['message']!,
                  style: TextStyle(
                    color: isMe ? Colors.white : const Color(0xff24282d),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xffe5e7eb))),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => _sendMessage(),
                  decoration: InputDecoration(
                    hintText: 'Tulis pesan...',
                    filled: true,
                    fillColor: const Color(0xfff1f3f5),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(color: Color(0xffe5e7eb)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(color: Color(0xffe5e7eb)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(
                        color: Color(0xffadb5bd),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: _sendMessage,
                icon: const Icon(Icons.send_rounded),
                color: const Color(0xff17191c),
                tooltip: 'Kirim pesan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
