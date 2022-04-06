import 'dart:math';

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
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                  child: Text(
                    "${context.watch<BlocPage>().names[context.watch<BlocPage>().random]}",
                    style: TextStyle(
                      fontSize: 30.0,
                      color:
                          context.watch<BlocPage>().colors[Random().nextInt(5)],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    for (var i = 0;
                        i < context.watch<BlocPage>().colors.length;
                        i++)
                      Padding(
                        padding: EdgeInsets.only(
                          left: Random().nextInt(300).toDouble(),
                          top: Random().nextInt(700).toDouble(),
                        ),
                        child: GestureDetector(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: data[i],
                          ),
                          onTap: context.watch<BlocPage>().start == true
                              ? null
                              : () {
                                  context.read<BlocPage>().rangTanlang(i);
                                },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            child: Visibility(
              visible: context.watch<BlocPage>().start,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  color: Colors.white.withOpacity(0.7),
                ),
                child: context.watch<BlocPage>().result != 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Right: ${context.watch<BlocPage>().result}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 30.0,
                            ),
                          ),
                          const Text(
                            "Game over",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 40.0,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                context.read<BlocPage>().startGame();
                              },
                              child: const Text("Start"))
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Stat the game",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 35.0,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<BlocPage>().startGame();
                            },
                            child: const Text("Start"),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
