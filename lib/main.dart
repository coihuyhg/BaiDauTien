import 'package:flutter/material.dart';
import 'package:flutter_app/routers/main_router.dart';
import 'package:flutter_app/routers/router_name.dart';
import 'package:flutter_app/screens/splash.dart';
import 'package:flutter_app/views_model/theme_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeModel>(
      create: (context) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (context, model, child) => MaterialApp(
          theme: model.themeData,
          onGenerateRoute: MainRouter.generate,
          initialRoute: RouterName.splash,
          title: "Bài viết nổi bật",
          home: Splash(),
        ),
      ),
    );
  }
}
