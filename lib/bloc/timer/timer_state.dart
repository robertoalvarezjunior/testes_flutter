part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  const TimerState(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}

final class TimerInitial extends TimerState {
  //pronto para começar a contagem regressiva a partir da duração especificada
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

final class TimerRunPause extends TimerState {
  //pausado com a duração restante
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

final class TimerRunInProgress extends TimerState {
  // contando ativamente a duração especificada
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

final class TimerRunComplete extends TimerState {
  //concluído com uma duração restante de 0
  const TimerRunComplete() : super(0);
}
