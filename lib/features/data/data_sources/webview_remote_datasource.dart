

class WebViewRemoteDataSource {
  Future<List<String>> fetchGameUrls() async {
    return [
      'https://www.miniclip.com/games/en/',
      'https://www.poki.com/',
      'https://www.y8.com/'
    ];
  }
}