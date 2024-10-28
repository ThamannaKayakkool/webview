import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(const NavbarInitialState(tabIndex: 0)) {
    on<NavbarEvent>((event, emit) {
     if(event is TabChangeEvent){
       emit(NavbarInitialState(tabIndex: event.tabIndex));
     }
    });
  }
}

