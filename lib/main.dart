import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal/core/secrets/app_secrets.dart';
import 'package:journal/core/theme/themes.dart';
import 'package:journal/features/auth/data/datasources/auth_remote_supabase_data_source.dart';
import 'package:journal/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:journal/features/auth/domain/usecases/user_sign_up.dart';
import 'package:journal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:journal/features/auth/presentation/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // to ensure that the flutter runs properly beforehand running additional procedure before runApp
  final supabase = await Supabase.initialize(
      url: AppSecret.supabaseUrl, anonKey: AppSecret.anonKey);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignUp: UserSignUp(
            AuthRepositoryImpl(
              authSupabaseDataSource:
                  AuthSupabaseDataSourceImpl(supabaseClient: supabase.client),
            ),
          ),
        ),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkMode,
      home: const LoginPage(),
    );
  }
}
