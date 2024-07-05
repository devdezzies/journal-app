import 'package:journal/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthSupabaseDataSource {
  Future<String> signUpwithEmailPassword(
      {required String email, required String username, required String password});

  Future<String> logInwithEmailPassword(
      {required String email, required String password});
}

class AuthSupabaseDataSourceImpl implements AuthSupabaseDataSource {
  final SupabaseClient supabaseClient;

  AuthSupabaseDataSourceImpl({required this.supabaseClient});
  @override
  Future<String> logInwithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement logInwithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpwithEmailPassword(
      {required String email,
      required String username,
      required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {'username': username});
      if (response.user == null) {
        throw ServerException(message: "user is null");
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
