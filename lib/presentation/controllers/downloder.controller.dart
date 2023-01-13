import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/utils/storage.dart';
import '/presentation/utils/permissions.dart';
import '/data/datasources/local/local.datasource.dart';
import '/presentation/extensions/async_value_extension.dart';

final platformState = ValueNotifier<TargetPlatform>(TargetPlatform.android);

final downloaderProvider = StateNotifierProvider.family
    .autoDispose<Downloader, AsyncValue<String?>, String>((ref, url) {
  return Downloader(localDataSource: ref.watch(localDataSourceProvider), url)
    ..initialize();
});

class Downloader extends StateNotifier<AsyncValue<String?>> {
  final LocalDataSource localDataSource;
  final String url;
  late String localPath = '';
  Downloader(this.url, {required this.localDataSource})
      : super(const AsyncData(null));

  Future<void> initialize() async {
    final permissionReady =
        await checkPermission(platform: platformState.value);
    if (permissionReady) {
      localPath = await prepareSaveDir(platform: platformState.value);
    }
  }

  ///
  Future<void> download(BuildContext context) async {
    final File file = File(url);
    final filename = basename(file.path);
    try {
      await Dio().download(
        url,
        '$localPath/$filename',
        onReceiveProgress: (count, total) {
          String x = '${((count / total) * 100).toStringAsFixed(0)}%';
          state = AsyncData(x);
        },
        options: Options(headers: {'Authorization': localDataSource.authToken}),
      );
      state = const AsyncData(null);
    } catch (error) {
      state.showFlushBarOnError(context,
          error: 'Check your Internet connection');
    }
  }

  ///
  Future<void> open(BuildContext context) async {
    final File file = File(url);
    final filename = basename(file.path);
    try {
      OpenFile.open('$localPath/$filename');
    } catch (error) {
      state.showFlushBarOnError(context, error: 'File not Exist');
    }
  }
}
