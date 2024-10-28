import 'package:webview/features/data/data_sources/webview_remote_datasource.dart';
import 'package:webview/features/domain/repositories/webview_repositories.dart';

class WebViewRepositoryImpl implements WebViewRepository {
  final WebViewRemoteDataSource remoteDataSource;

  WebViewRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<String>> getGameUrls() async {
    return await remoteDataSource.fetchGameUrls();
  }
}