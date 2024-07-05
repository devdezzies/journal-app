import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String username,
    required String email,
    required String password 
  });

  Future<Either<Failure, String>> logInWithEmailPassword({
    required String email,
    required String password 
  });
}