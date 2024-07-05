import 'package:fpdart/src/either.dart';
import 'package:journal/core/error/exceptions.dart';
import 'package:journal/core/error/failure.dart';
import 'package:journal/features/auth/data/datasources/auth_remote_supabase_data_source.dart';
import 'package:journal/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthSupabaseDataSource authSupabaseDataSource;
  AuthRepositoryImpl({required this.authSupabaseDataSource}); 

  @override
  Future<Either<Failure, String>> logInWithEmailPassword({required String email, required String password}) {
    // TODO: implement logInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({required String username, required String email, required String password}) async {
    try {
      final userId = await authSupabaseDataSource.signUpwithEmailPassword(email: email, username: username, password: password);
      return right(userId);
    } on ServerException catch(e) {
      throw left(Failure(e.toString()));
    }
  } 
}