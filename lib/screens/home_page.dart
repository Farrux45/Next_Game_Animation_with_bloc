import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_animation/bloc/bloc_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BlocPage(),
      child: BlocConsumer<BlocPage, BlocState>(
        listener: (context, state) {},
        builder: (context, state) {
          return myScaffold(context);
        },
      ),
    );
  }

  Scaffold myScaffold(BuildContext context) {
    List<Color> data = context.watch<BlocPage>().colors;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 28, 28),
      appBar: AppBar(
        title: Text(
          "Right: ${context.watch<BlocPage>().result}",
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 12, 11, 11),
        actions: [
          Text(
            context.watch<BlocPage>().timeCount.toString(),
          ),
        ],
      ),
    );
  }
}
