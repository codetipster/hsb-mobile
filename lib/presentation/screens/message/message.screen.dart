import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/screens/auth/widgets/custom_auth_scaffold_layout.dart';
import 'package:invoice_tracking_flutter/presentation/screens/home/widgets/custom_appbar.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/custom_scaffold.layout.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageScreen extends ConsumerStatefulWidget {
  const MessageScreen({super.key});

  @override
  MessageScreenState createState() => MessageScreenState();
}

class MessageScreenState extends ConsumerState<MessageScreen>
    with WidgetsBindingObserver {
  List<types.Message> messages = [];
  final _user = const types.User(id: '1');

  @override
  initState() {
    super.initState();
    _loadMessages();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldLayout(
      isScrollable: false,
      appBar: customAppBar(context, ref),
      body: Chat(
        messages: messages,
        dateHeaderThreshold: 50000,
        onSendPressed: (p0) {
          setState(() {
            messages.insert(
                0,
                types.TextMessage(
                  author: _user,
                  id: (Random.secure().nextDouble() * 20000).toString(),
                  text: p0.text,
                  status: types.Status.sent,
                  createdAt: DateTime.now().millisecondsSinceEpoch,
                ));
          });
        },
        theme: DefaultChatTheme(
          primaryColor: context.colorScheme.primary,
          inputMargin: const EdgeInsets.symmetric(vertical: 10),
          inputBackgroundColor: context.theme.inputDecorationTheme.fillColor ??
              context.theme.scaffoldBackgroundColor,
          inputContainerDecoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: kDefaultRaduis,
          ),
          inputTextColor: context.colorScheme.onBackground,
          sendButtonIcon:
              Icon(Icons.send, color: context.colorScheme.onBackground),
        ),
        showUserAvatars: true,
        showUserNames: true,
        user: _user,
      ),
    );
  }

  void _loadMessages() async {
    final x = data
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      messages = x;
    });
  }
}

const data = [];
