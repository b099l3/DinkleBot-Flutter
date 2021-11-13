import 'package:dinklebot/core/presentation/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      ProviderScope(
        child: AppWidget(),
      ),
    );
