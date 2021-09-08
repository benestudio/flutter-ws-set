import 'package:f_set/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_flutter/webview_flutter.dart';

const shopUrl = 'https://www.wikiwand.com/en/Set_(card_game)';

class InstructionsScreen extends HookWidget {
  const InstructionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final webViewIsLoading = useState(false);
    final webViewHasError = useState(false);
    final webViewController = useState<WebViewController?>(null);

    void setIsLoading(bool value) {
      webViewIsLoading.value = value;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Instructions'),
          backwardsCompatibility: false,
        ),
        body: Stack(
          children: [
            Builder(
              builder: (context) {
                if (webViewHasError.value) {
                  return const Center(child: Text('Could not load'));
                }

                return WebView(
                  initialUrl: shopUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (controller) => webViewController.value = controller,
                  onPageStarted: (url) => setIsLoading(true),
                  onPageFinished: (url) => setIsLoading(false),
                  onWebResourceError: (error) => webViewHasError.value = true,
                );
              },
            ),
            Builder(
              builder: (context) {
                if (webViewIsLoading.value) {
                  return const LinearProgressIndicator(color: AppTheme.green);
                }
                return Container(
                  height: 0,
                  color: AppTheme.gray3,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
