import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class SimplePage extends StatelessWidget {
  final Map<String, dynamic>? parameters;
  const SimplePage({super.key, this.parameters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              BoostNavigator.instance
                  .pop({"data": "return data from Flutter - SimplePage"});
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('SimplePage', style: TextStyle(fontSize: 16)),
            Text('data: ${json.encode(parameters ?? {})}'),
          ],
        ),
      ),
    );
  }
}
