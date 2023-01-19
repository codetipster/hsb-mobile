// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/app.service.dart';
import 'package:invoice_tracking_flutter/core/api/result.entity.dart';
import 'package:invoice_tracking_flutter/data/datasources/local/local.datasource.dart';
import 'package:invoice_tracking_flutter/data/entities/employee.entity.dart';
import 'package:invoice_tracking_flutter/data/entities/invoice.entity.dart';
import 'package:invoice_tracking_flutter/data/entities/report.entity.dart';
import 'package:invoice_tracking_flutter/data/entities/user.entity.dart';


const String SIGNIN = '/client/login';
const String PROFILE = '/client/profile';
const String INVOICES = '/client/invoices';
const String REPORTS = '/client/reports';
const String EMPLOYEES = '/client/employees';

final remoteDataSourceProvider = Provider<RemoteDataSource>(
  (ref) => RemoteDataSource(
    localDataSource: ref.watch(localDataSourceProvider),
    dioClient: ref.watch(dioProvider),
  ),
);

class RemoteDataSource {
  final Dio dioClient;
  final LocalDataSource localDataSource;

  RemoteDataSource({
    required this.dioClient,
    required this.localDataSource,
  });

  Future<Result<UserEntity>> signIn(
      {required Map<String, dynamic> data}) async {
    return Result.guardFuture(() async {
      final result = await dioClient.post(SIGNIN, data: data);
      final userData = UserEntity.fromJson(result.data);
      // user data
      await localDataSource.storeUser(user: json.encode(result.data));
      await localDataSource.storeAuthToken(authToken: result.data['token']);
      await localDataSource.storeSignedInState(isSignedIn: true);

      return userData;
    });
  }

  Future<Result<UserEntity>> uploadProfile(
      {required Map<String, dynamic> formData, required File? image}) async {
    // Authorization
    dioClient.options = dioClient.options
        .copyWith(headers: {'Authorization': localDataSource.authToken});
    
    return Result.guardFuture(() async {
      if (image != null) {
        FormData data = FormData.fromMap({
          ...formData,
          "image": await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
          ),
        });
        final result = await dioClient.put(PROFILE, data: data);
        await localDataSource.storeUser(user: json.encode(result.data));
        return UserEntity.fromJson(result.data);
      }
      final result = await dioClient.put(PROFILE, data: formData);
      await localDataSource.storeUser(user: json.encode(result.data));
      return UserEntity.fromJson(result.data);
    });
  }

  Future<Result<List<InvoiceEntity>>> getInvoices() async {
    // Authorization
    dioClient.options = dioClient.options
        .copyWith(headers: {'Authorization': localDataSource.authToken});

    return Result.guardFuture(() async {
      final result = await dioClient.get(INVOICES);
      List<dynamic> data = result.data;
      return data.map((e) => InvoiceEntity.fromJson(e)).toList();
    });
  }

  Future<Result<InvoiceEntity>> uploadInvoice(
      {required String name, required File image}) async {
    // Authorization
    dioClient.options = dioClient.options
        .copyWith(headers: {'Authorization': localDataSource.authToken});

    return Result.guardFuture(() async {
      FormData data = FormData.fromMap({
        "name": name,
        "image": await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });

      final result = await dioClient.post(INVOICES, data: data);
      return InvoiceEntity.fromJson(result.data);
    });
  }

  Future<Result<List<ReportEntity>>> getReports() async {
    // Authorization
    dioClient.options = dioClient.options
        .copyWith(headers: {'Authorization': localDataSource.authToken});

    return Result.guardFuture(() async {
      final result = await dioClient.get(REPORTS);
      List<dynamic> data = result.data;
      return data.map((e) => ReportEntity.fromJson(e)).toList();
    });
  }

  Future<Result<List<EmployeeEntity>>> getEmployees() async {
    // Authorization
    dioClient.options = dioClient.options
        .copyWith(headers: {'Authorization': localDataSource.authToken});

    return Result.guardFuture(() async {
      final result = await dioClient.get(EMPLOYEES);
      List<dynamic> data = result.data;
      return data.map((e) => EmployeeEntity.fromJson(e)).toList();
    });
  }

  Future<Result<EmployeeEntity>> createEmployee(
      {required Map<String, dynamic> formData}) async {
    // Authorization
    dioClient.options = dioClient.options
        .copyWith(headers: {'Authorization': localDataSource.authToken});

    return Result.guardFuture(() async {
      final result = await dioClient.post(EMPLOYEES, data: formData);
      return EmployeeEntity.fromJson(result.data);
    });
  }

  Future<Result<EmployeeEntity>> updateEmployee(
      {required Map<String, dynamic> formData, required String id}) async {
    // Authorization
    dioClient.options = dioClient.options
        .copyWith(headers: {'Authorization': localDataSource.authToken});

    return Result.guardFuture(() async {
      final result = await dioClient.put("$EMPLOYEES/$id", data: formData);
      return EmployeeEntity.fromJson(result.data);
    });
  }
}
