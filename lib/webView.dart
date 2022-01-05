import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WebViewPage extends HookWidget {
  final String title;
  final String url;
   WebViewPage(this.title, this.url);
@override
  Widget build(BuildContext context) {
      FlutterWebviewPlugin flutterWebviewPlugin;
    useEffect(() {
      flutterWebviewPlugin = FlutterWebviewPlugin();
      return () => flutterWebviewPlugin.dispose();
    }, []);

    return WebviewScaffold(
      url: url,
      withJavascript: true,
      resizeToAvoidBottomInset: true,
      withZoom: true,
      // hidden: true,
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        title: Text(title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => flutterWebviewPlugin.reload()),
        ],
      ),
    );
  }
}