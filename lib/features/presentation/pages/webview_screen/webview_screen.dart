import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview/features/presentation/bloc/webview_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              isLoading = progress < 100;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            _showErrorDialog("Page load error: ${error.description}");
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    _fetchAndLoadUrls();
  }

  Future<void> _fetchAndLoadUrls() async {
    final bloc = context.read<WebViewBloc>();
    await bloc.fetchGameUrls();
    final initialUrl = bloc.state;
    controller.loadRequest(Uri.parse(initialUrl));
  }

  Future<void> _reloadPage() async {
    await controller.reload();
  }

  Future<void> _showErrorDialog(String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Platform'),
        actions: [
          BlocBuilder<WebViewBloc, String>(
            builder: (context, currentUrl) {
              return DropdownButton<String>(
                value: currentUrl,
                items: context.read<WebViewBloc>().gameUrls.map((String url) {
                  return DropdownMenuItem<String>(
                    value: url,
                    child: Text(Uri.parse(url).host),
                  );
                }).toList(),
                onChanged: (String? newUrl) {
                  if (newUrl != null) {
                    context.read<WebViewBloc>().changeUrl(newUrl);
                    controller.loadRequest(Uri.parse(newUrl));
                  }
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _reloadPage,
            child: WebViewWidget(controller: controller),
          ),
          if (isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}