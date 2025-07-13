import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_logic_event.dart';
part 'game_logic_state.dart';

class GameLogicBloc extends Bloc<GameLogicEvent, GameLogicState> {
  GameLogicBloc()
      : super(const GameLogicState(
          board: [],
          currentPlayer: 'X',
          winner: null,
        )) {
    on<Isclicked>(onclick);
  }

  void onclick(Isclicked event, Emitter<GameLogicState> emit) {
    List<String> newboard = List.from(state.board);
    if (newboard[event.index] != '' || state.winner == null) return;

    newboard[event.index] = state.currentPlayer;
    String? findwinner = checkwinner(newboard);

    String nextplayer;
    if (state.currentPlayer == 'X') {
      nextplayer = 'O';
    } else {
      nextplayer = 'X';
    }

    String newwinner = null;
    if (findwinner != null) {
      newwinner = findwinner;
    }

    emit(state.cpy(
      winner: newwinner,
      board: newboard,
      currentPlayer: nextplayer,
    ));
  }

  String? checkwinner(List<String> g) {
    if (g[0] == g[1] && g[1] == g[2]) return g[0];//row1
    if (g[3] == g[4] && g[4] == g[5]) return g[3];//row2
    if (g[6] == g[7] && g[7] == g[8]) return g[6];//row3
    if (g[0] == g[3] && g[3] == g[6]) return g[0];//column1
    if (g[1] == g[4] && g[4] == g[7]) return g[1];//column2
    if (g[2] == g[5] && g[5] == g[8]) return g[2];//cpolmn3
    if (g[2] == g[4] && g[4] == g[6]) return g[2];//diagonal1
    if (g[0] == g[4] && g[4] == g[8]) return g[0];//diagonal2

    return null;
  }
}
