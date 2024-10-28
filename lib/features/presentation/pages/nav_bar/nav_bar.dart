import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview/features/presentation/bloc/nav_bar/navbar_bloc.dart';
import 'package:webview/features/presentation/pages/home_screen/home_screen.dart';
import 'package:webview/features/presentation/pages/webview_screen/webview_screen.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(
      Icons.home_outlined,
    ),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.web,
    ),
    label: 'WebView',
  ),
];

const List<Widget> bottomNavScreen = <Widget>[HomeScreen(), WebViewScreen()];

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavbarBloc, NavbarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(child: bottomNavScreen.elementAt(state.tabIndex)),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.indigo,
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            onTap: (index) {
              BlocProvider.of<NavbarBloc>(context)
                  .add(TabChangeEvent(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}
