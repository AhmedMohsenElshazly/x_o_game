import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_o_game/bloc/bloc/game_logic_bloc.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 82, 176),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
              child: Text(
                'X O Game',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //Winner message
            BlocBuilder<GameLogicBloc, GameState>(
              builder: (context, state) {
                if (state.winner != null && state.winner!.isNotEmpty) {
                  return Text(
                    ' ${state.winner}',
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                return Text(
                  'Turn: Player ${state.currentPlayer}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            Expanded(
              child: BlocBuilder<GameLogicBloc, GameState>(
                builder: (context, state) {
                  return GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      String cellText = '';
                      if (index < state.board.length) {
                        cellText = state.board[index];
                      }
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<GameLogicBloc>()
                              .add(Isclicked(index: index));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              cellText,
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            ElevatedButton(
              child: const Text("Reset"),
              onPressed: () {
                context.read<GameLogicBloc>().add(RestGame());
              },
            )
          ],
        ),
      ),
    );
  }
}
