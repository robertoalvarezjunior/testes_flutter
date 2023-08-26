part of 'timer_bloc.dart';

sealed class TimerEvent {
  const TimerEvent();
}

final class TimerStarted extends TimerEvent {
  //informa ao TimerBloc que o timer deve ser iniciado
  const TimerStarted({required this.duration});
  final int duration;
}

final class TimerPaused extends TimerEvent {
  //informa ao TimerBloc que o cronômetro deve ser pausado
  const TimerPaused();
}

final class TimerResumed extends TimerEvent {
  //informa o TimerBloc que o cronômetro deve ser reiniciado
  const TimerResumed();
}

class TimerReset extends TimerEvent {
  //informa ao TimerBloc que o timer deve ser redefinido para o estado original
  const TimerReset();
}

class _TimerTicked extends TimerEvent {
  //informa ao TimerBloc que um tick ocorreu e que ele precisa atualizar seu estado de acordo
  const _TimerTicked({required this.duration});
  final int duration;
}
