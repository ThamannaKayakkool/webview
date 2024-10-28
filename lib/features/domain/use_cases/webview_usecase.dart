import 'package:webview/features/domain/repositories/webview_repositories.dart';

class WebViewUseCases {
  final WebViewRepository repository;

  WebViewUseCases(this.repository);

  Future<List<String>> call() async {
    return await repository.getGameUrls();
  }
}