import 'package:flutter/material.dart';
import 'package:post_apicall/screen/post_screen/provider/post_provider.dart';
import 'package:post_apicall/screen/post_screen/view/post_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Post_Provider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '1',
        routes: {
          '/': (context) => Post_Screen(),
          // '1': (context) => India(),

        },
      ),
    ),
  );
}
