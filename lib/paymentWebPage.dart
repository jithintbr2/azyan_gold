import 'package:azyan/paymentSuccess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:azyan/listSchemes.dart';
import 'package:azyan/new_login.dart';
import 'package:webview_flutter/webview_flutter.dart';


class PaymentWebPage extends StatefulWidget {
   int tempId;
   String tocken;
   PaymentWebPage(this.tempId,this.tocken);

  @override
  _PaymentWebPage createState() => _PaymentWebPage();
}
WebViewController controllerGlobal;

class _PaymentWebPage extends State<PaymentWebPage> {
  final String successPage = "payment_success";
  final String failurePage = "payment_failure";
  String url = "https://login2.in/azyan/index.php/CustomerApi/online_payment";
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onUrlChanged.listen((String url) async {
      print("Loaded $url");
      print("navigating to...$url");
      if (url.toLowerCase().contains(successPage)) {
        Navigator.of(context).pop(true);
      } else if (url.toLowerCase().contains(failurePage)) {
        Navigator.of(context).pop(false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    flutterWebviewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>_exitApp(context),
      child: _buildSimpleWebView(),
      //child: Container(),
    );

  }

  Widget _buildSimpleWebView() {
    print("Initial URL => $url/?temp_id=${widget.tempId}");
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.yellow[800],
            title: Text("Payment",style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),)),
        body: Column(
          children: <Widget>[
            Expanded(
              child: WebView(
                initialUrl: "$url/?temp_id=${widget.tempId}",
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  controllerGlobal = webViewController;
                },
                onPageFinished: (url) async {
                  print("Loaded $url");
                  print("......done/////....");
                  print(widget.tempId);
                  if (url.toLowerCase().contains(successPage)) {
                    print(successPage);
                    // Navigator.of(context).pop(true);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentSuccess(widget.tempId,widget.tocken)),
                    );
                  } else if (url.toLowerCase().contains(failurePage)) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Payment Failed.'),
                      backgroundColor: Colors.red,
                      elevation: 10,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10),
                    ));
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        ));
  }

  Future<bool> _exitApp(BuildContext context) async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Warning"),
        content: Text(
            "Going back now may cause payment not processed correctly. Do you really want to go back?"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () async {
             // String tocken = await Common.getSharedPref("tocken");
                Navigator.of(ctx).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (ctx) =>
                          ListSchemes(widget.tocken)),
                      (Route<dynamic> route) => false);


            },
            child: Text("okay"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Cancel"),
          ),
        ],
      ),
    );

// return false;
  }
}
