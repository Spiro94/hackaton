import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton/app.dart';
import 'package:hackaton/shared/local_notice_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalNoticeService().setup();
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}
