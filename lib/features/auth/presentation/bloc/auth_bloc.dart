import 'package:bloc/bloc.dart';
import 'package:journal/features/auth/domain/usecases/user_sign_up.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;

  AuthBloc({required UserSignUp userSignUp}) : _userSignUp = userSignUp,
  super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final response = await _userSignUp(
        UserSignUpParams(username: event.username, email: event.email, password: event.password)
      );
      response.fold((failure) => emit(AuthFailure(failure.message)), (success) => emit(AuthSuccess(success)));
    });
  }
}
