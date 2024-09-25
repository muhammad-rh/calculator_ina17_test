import 'package:calculator_ina17_test/config/routes/routes.dart';
import 'package:calculator_ina17_test/config/theme/app_themes.dart';
import 'package:calculator_ina17_test/features/calculator/bloc/calculator/calculator_bloc.dart';
import 'package:calculator_ina17_test/features/calculator/cubit/input_cubit.dart';
import 'package:calculator_ina17_test/features/calculator/presentation/pages/home/calculator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InputCubit>(create: (_) => InputCubit()),
        BlocProvider<CalculatorBloc>(create: (_) => CalculatorBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        title: 'Calculator',
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const Calculator(),
      ),
    );
  }
}
