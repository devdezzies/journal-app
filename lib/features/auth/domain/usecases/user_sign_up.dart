import 'package:fpdart/src/either.dart';
import 'package:journal/core/error/failure.dart';
import 'package:journal/core/usecase/usecase.dart';
import 'package:journal/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepository authRepository;
  UserSignUp(this.authRepository); 

  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(username: params.username, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String username; 
  final String email;
  final String password;
  UserSignUpParams({required this.username, required this.email, required this.password});
}