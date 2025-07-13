part of 'game_logic_bloc.dart';
//using the event called iscalled beings the index to klnow which block was clicked on 
abstract class GameLogicEvent extends Equatable {
  const GameLogicEvent();

  @override
  List<Object> get props => [];
}

class Isclicked extends GameLogicEvent {
  final int index;

  const Isclicked({ required this.index});
@override
  List<Object> get props => [index];

}

class RestGame extends GameLogicEvent{}


