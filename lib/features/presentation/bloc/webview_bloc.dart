import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview/features/domain/use_cases/webview_usecase.dart';

class WebViewBloc extends Cubit<String> {
  final WebViewUseCases loadGameUrl;
  List<String> gameUrls = [];

  WebViewBloc(this.loadGameUrl) : super('https://www.miniclip.com/games/en/');

  Future<void> fetchGameUrls() async {
    gameUrls = await loadGameUrl.call();
  }

  void changeUrl(String newUrl) {
    emit(newUrl);
  }
}