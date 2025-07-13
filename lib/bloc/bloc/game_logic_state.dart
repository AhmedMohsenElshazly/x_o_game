// game_logic_state.dart
part of 'game_logic_bloc.dart';

class GameLogicState extends Equatable {
  final List<String> board;
  final String currentPlayer;
  final String? winner;

  const GameLogicState({
    required this.board,
    required this.currentPlayer,
     this.winner,

  });

  GameLogicState cpy({ // allow me to create a new object from a existinfg class
    List<String>? board,
    String? currentPlayer,
    required String winner,
  }) {
    return GameLogicState(
      board: board ?? this.board, 
      currentPlayer: currentPlayer ??
          this.currentPlayer, // ?? is called coalesing operater for ex. a ?? b: This expression returns the value of a if a is not null or undefined. If a is null or undefined, it returns the value of b.
      winner: winner,
    );
  }

  @override
  List<Object?> get props => [board, currentPlayer, winner];
}
