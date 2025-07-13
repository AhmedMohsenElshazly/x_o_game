import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_logic_event.dart';
part 'game_logic_state.dart';

class GameLogicBloc extends Bloc<GameLogicEvent, GameState> {
  GameLogicBloc()
      : super(InitGameState(
          board: List.filled(9, ''), //ai suggestion

          currentPlayer: 'X',
        
        )) {
    on<Isclicked>(onclick);
    on<RestGame>((event, emit) {
      emit(InitGameState(
        board: List.filled(9, ''),
        currentPlayer: 'X',
      
      ));
    });
  }

  void onclick(Isclicked event, Emitter<GameState> emit) {
    List<String> newboard = List.from(state.board);
    if (newboard[event.index] != '' || state.winner != null) {
      return; //checks if the cell is already clicked on or if there is a winner
    }

    newboard[event.index] = state.currentPlayer;
    String? findwinner = checkwinner(newboard);
    bool isfullboard = newboard.every((value) => value.isNotEmpty);
    String? newwinner; //check for winn
    if (findwinner != null) {
      newwinner = "Player $findwinner Winner";
    }

    if (isfullboard && findwinner == null) {
      newwinner = "Draw";
    }

    String nextplayer; // determines the next player
    if (state.currentPlayer == 'X') {
      nextplayer = 'O';
    } else {
      nextplayer = 'X';
    }

    emit(GameState(board: newboard, currentPlayer: nextplayer,winner: newwinner)
    );
  }

  String? checkwinner(List<String> g) {
    //logic to check winner
    if (g[0].isNotEmpty && g[0] == g[1] && g[1] == g[2]) return g[0]; //row1
    if (g[3].isNotEmpty && g[3] == g[4] && g[4] == g[5]) return g[3]; //row2
    if (g[6].isNotEmpty && g[6] == g[7] && g[7] == g[8]) return g[6]; //row3
    if (g[0].isNotEmpty && g[0] == g[3] && g[3] == g[6]) return g[0]; //column1
    if (g[1].isNotEmpty && g[1] == g[4] && g[4] == g[7]) return g[1]; //column2
    if (g[2].isNotEmpty && g[2] == g[5] && g[5] == g[8]) return g[2]; //column3
    if (g[2].isNotEmpty && g[2] == g[4] && g[4] == g[6]) {
      return g[2]; //diagonal1
    }
    if (g[0].isNotEmpty && g[0] == g[4] && g[4] == g[8]) {
      return g[0]; //diagonal2
    }

    return null;
  }
}
