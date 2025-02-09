import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zmtest/features/offline/presentation/pages/fish_home_page.dart';
import 'package:zmtest/features/webView/web_view_screen.dart';
import 'package:zmtest/features/startup/presentation/cubit/startup_cubit.dart';
import 'package:zmtest/features/startup/presentation/cubit/startup_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<StartupCubit>();
    Future.microtask(() => cubit.checkLink());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<StartupCubit, StartupState>(
        listener: (context, state) async {
          switch (state) {
            case StartupSuccess():
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => WebViewScreen()));
            case StartupFailure():
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => FishHomePage()));

            default:
          }
        },
        child: Center(
          child: Image.asset('assets/images/splash.png'),
        ),
      ),
    );
  }
}
