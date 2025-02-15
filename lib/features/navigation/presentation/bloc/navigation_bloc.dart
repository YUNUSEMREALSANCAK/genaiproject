import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationIndexChanged extends NavigationEvent {
  final int index;

  const NavigationIndexChanged(this.index);

  @override
  List<Object> get props => [index];
}

// States
class NavigationState extends Equatable {
  final int currentIndex;

  const NavigationState(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}

// Bloc
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState(0)) {
    on<NavigationIndexChanged>((event, emit) {
      emit(NavigationState(event.index));
    });
  }
}
