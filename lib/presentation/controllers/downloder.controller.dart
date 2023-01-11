import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/core/errors/app.failure.dart';
import 'package:invoice_tracking_flutter/data/datasources/local/local.datasource.dart';
import 'package:path/path.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/async_value_extension.dart';

final downloaderProvider = StateNotifierProvider.family
    .autoDispose<Downloader, AsyncValue<String?>, String>((ref, url) {
  return Downloader(localDataSource: ref.watch(localDataSourceProvider), url);
});

class Downloader extends StateNotifier<AsyncValue<String?>> {
  final LocalDataSource localDataSource;
  final String url;
  Downloader(this.url, {required this.localDataSource})
      : super(const AsyncData(null));

  Future<void> download(BuildContext context,
      {required String savePath}) async {
    final File file = File(url);
    final filename = basename(file.path);
    try {
      await Dio().download(
        url,
        '$savePath/$filename',
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
}
