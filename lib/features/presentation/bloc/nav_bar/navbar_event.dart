part of 'navbar_bloc.dart';

@immutable
abstract class NavbarEvent extends Equatable{}


class TabChangeEvent extends NavbarEvent {
  final int tabIndex;

  TabChangeEvent({required this.tabIndex});

  @override
  List<Object?> get props => [tabIndex];
}