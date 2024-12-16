/*
 * @Author: sjpsega
 * @Date: 2024-12-16 17:31:36
 * @LastEditors: sjpsega
 * @LastEditTime: 2024-12-16 20:09:29
 * @Description: 
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class SimplePage extends StatelessWidget {
  final Map<String, dynamic>? parameters;
  const SimplePage({super.key, this.parameters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('SimplePage', style: TextStyle(fontSize: 16)),
            Text('data: ${json.encode(parameters ?? {})}'),
            GestureDetector(
              child: const Text('Pop Current Page',
                  style: TextStyle(color: Colors.blue)),
              onTap: () {
                BoostNavigator.instance
                    .pop({"data": "return data from Flutter - SimplePage"});
              },
            ),
          ],
        ),
      ),
    );
  }
}
