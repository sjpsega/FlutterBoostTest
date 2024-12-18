import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class MainPage extends StatelessWidget {
  final Map<String, dynamic>? parameters;
  const MainPage({super.key, this.parameters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              BoostNavigator.instance
                  .pop({"data": "return data from Flutter - MainPage"});
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('MainPage', style: TextStyle(fontSize: 16)),
            Text('data:${json.encode(parameters ?? {})}'),
            GestureDetector(
              child: const Text('Open Flutter Simple Page',
                  style: TextStyle(color: Colors.blue)),
              onTap: () async {
                final callBackData = await BoostNavigator.instance.push(
                    'simplePage',
                    arguments: {'data': 'data from Flutter - MainPage'});
                debugPrint('SimplePage callback data:$callBackData');
                if (!context.mounted) return;
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('SimplePage callback data'),
                      content: Text(json.encode(callBackData)),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
