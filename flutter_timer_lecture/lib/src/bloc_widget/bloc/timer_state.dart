part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  final double percent;
  final String timeStr;
  final bool isRun;

  const TimerState(this.timeStr, this.percent, this.isRun);

  @override
  List<Object> get props => [timeStr, percent];
}

class TimerInitial extends TimerState {
  const TimerInitial(String timeStr, double percent) : super(timeStr, percent, false);

  @override
  String toString() => 'TimerInitial { timeStr: $timeStr }';
}

class TimerRunState extends TimerState {
  const TimerRunState(String timeStr, double percent) : super(timeStr, percent, true);

  @override
  String toString() => 'TimerRunState { timeStr: $timeStr }';
}

class TimerPauseState extends TimerState {
  const TimerPauseState(String timeStr, double percent) : super(timeStr, percent, false);

  @override
  String toString() => 'TimerRunState { timeStr: $timeStr }';
}

class TimerResetState extends TimerState {
  const TimerResetState(String timeStr, double percent, bool isRun) : super(timeStr, percent, isRun);

  @override
  String toString() => 'TimerRunState { timeStr: $timeStr }';
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super('00:00', 0, false);
}