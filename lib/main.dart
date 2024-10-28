import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview/features/data/repositories/webview_repository_impl.dart';
import 'package:webview/features/presentation/bloc/nav_bar/navbar_bloc.dart';
import 'package:webview/features/presentation/bloc/webview_bloc.dart';
import 'package:webview/features/presentation/pages/nav_bar/nav_bar.dart';
import 'features/data/data_sources/webview_remote_datasource.dart';
import 'features/domain/use_cases/webview_usecase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavbarBloc(),),
        BlocProvider(
          create: (context) => WebViewBloc(WebViewUseCases(WebViewRepositoryImpl(WebViewRemoteDataSource()))),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: NavBar(),
      ),
    );
  }
}


