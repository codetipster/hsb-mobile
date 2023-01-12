// part of 'package:invoice_tracking_flutter/presentation/screens/auth/widgets/signin_form.dart';

// final signInPageControllerProvider =
//     StateNotifierProvider.autoDispose<SignInPageController, AsyncValue<void>>(
//   (ref) {
//     return SignInPageController(apiProvider: null);
//   },
// );

// class SignInPageController extends StateNotifier<AsyncValue<void>> {
//   final  apiProvider;
//   SignInPageController({required this.apiProvider})
//       : super(const AsyncData(null));

//   void signIn(
//       {required Map<String, dynamic>? data, required Function() next}) async {
//     state = const AsyncLoading();
//     // final result = await apiProvider.parentSignIn(data: data!);
//     await Future.delayed(const Duration(seconds: 3));
//     state = const AsyncData(null);
//     // if (result.isNotEmpty) {
//       showToast(msg: 'some error message!');
//       return;
//     // }
//     next();
//   }
// }
