part of 'navbar_bloc.dart';

@immutable
abstract class NavbarState extends Equatable {
  final int tabIndex;

  const NavbarState({required this.tabIndex});

  @override
  List<Object?> get props => [tabIndex];
}

class NavbarInitialState extends NavbarState {
  const NavbarInitialState({required super.tabIndex});
}

