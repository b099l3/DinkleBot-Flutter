import 'package:dinklebot/auth/application/auth_notifier.dart';
import 'package:dinklebot/auth/infrastructure/bungie_authenticator.dart';
import 'package:dinklebot/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:dinklebot/auth/infrastructure/credentials_storage/secure_credentials_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final flutterSecureStorageProvider =
    Provider((ref) => const FlutterSecureStorage());

final dioProvider = Provider((ref) => Dio());

final credentialsStorageProvider = Provider<CredentialsStorage>(
  (ref) => SecureCredentialsStorage(
    ref.watch(flutterSecureStorageProvider),
  ),
);

final githubAuthenticatorProvider = Provider(
  (ref) => BungieAuthenticator(
    ref.watch(credentialsStorageProvider),
    ref.watch(dioProvider),
  ),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(githubAuthenticatorProvider),
  ),
);
