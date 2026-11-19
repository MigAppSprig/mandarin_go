import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/main_shell.dart';
import 'services/progress_controller.dart';
import 'services/tts_service.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final progress = ProgressController();
  await progress.load();

  // Warm up the speech engine so the first tap is responsive.
  TtsService.instance.init();

  runApp(MandarinGoApp(progress: progress));
}

class MandarinGoApp extends StatelessWidget {
  const MandarinGoApp({super.key, required this.progress});

  final ProgressController progress;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProgressController>.value(
      value: progress,
      child: MaterialApp(
        title: 'MandarinGo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        home: const MainShell(),
      ),
    );
  }
}
