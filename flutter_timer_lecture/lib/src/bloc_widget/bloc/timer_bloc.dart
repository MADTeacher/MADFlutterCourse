import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  Timer? _timer;
  final int _waitTimeInSec;
  int _currentWaitTimeInSec;

  TimerBloc({required int waitTimeInSec})
      : _waitTimeInSec = waitTimeInSec,
        _currentWaitTimeInSec = waitTimeInSec,
        super(TimerInitial(_calculationTime(waitTimeInSec), 1));

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  @override
  Stream<TimerState> mapEventToState(
    TimerEvent event,
  ) async* {
    if (event is TimerStarted) {
      yield* _mapTimerStartedToState(event);
    } else if (event is TimerPaused) {
      yield* _mapTimerPausedToState(event);
    } else if (event is TimerReset) {
      yield* _mapTimerResetToState(event);
    } else if (event is TimerTicked) {
      yield* _mapTimerTickedToState(event);
    } else if (event is TimerStop) {
      yield* _mapTimerStopToState(event);
    }
  }

  Stream<TimerState> _mapTimerStartedToState(TimerStarted start) async* {
    if (_currentWaitTimeInSec > 0) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _currentWaitTimeInSec -= 1;
        add(TimerTicked(
            timeStr: _calculationTime(_currentWaitTimeInSec),
            percent: _currentWaitTimeInSec / _waitTimeInSec));
        if (_currentWaitTimeInSec <= 0) {
          _timer?.cancel();
          add(const TimerStop());
        }
      });
    }
  }

  Stream<TimerState> _mapTimerPausedToState(TimerPaused pause) async* {
    if (state is TimerRunState) {
      _timer?.cancel();
      yield TimerPauseState(_calculationTime(_currentWaitTimeInSec),
          _currentWaitTimeInSec / _waitTimeInSec);
    }
  }

  Stream<TimerState> _mapTimerResetToState(TimerReset reset) async* {
    _currentWaitTimeInSec = _waitTimeInSec;
    yield TimerResetState(_calculationTime(_currentWaitTimeInSec),
        _currentWaitTimeInSec / _waitTimeInSec, state.isRun);
  }

  Stream<TimerState> _mapTimerStopToState(TimerStop stop) async* {
    if (state is TimerRunState) {
      yield const TimerRunComplete();
    }
  }

  Stream<TimerState> _mapTimerTickedToState(TimerTicked tick) async* {
    yield TimerRunState(tick.timeStr, tick.percent);
  }

  static String _calculationTime(int currentWaitTimeInSec) {
    var minuteStr = (currentWaitTimeInSec ~/ 60).toString().padLeft(2, '0');
    var secondStr = (currentWaitTimeInSec % 60).toString().padLeft(2, '0');
    return '$minuteStr:$secondStr';
  }
}
