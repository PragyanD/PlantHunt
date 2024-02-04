import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GlobeView(),
    );
  }
}

class GlobeView extends StatelessWidget { // should be Stateful right?
  final String googleMapsApiKey = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Satellite Globe View'),
      ),
      body: InAppWebView(
        initialData: InAppWebViewInitialData(
          data: '<iframe src="https://www.google.com/maps/embed/v1/view?key=$googleMapsApiKey&center=0,0&zoom=1&maptype=satellite" width="100%" height="100%"></iframe>',
          mimeType: 'text/html',
          encoding: 'utf8',
        ),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
          ),
        ),
        onLoadError: (InAppWebViewController controller, Uri? url, int code, String message) {
          // Handle the error here
          print('Error: $code, $message');

          controller.loadData(
            data: '<html><body><h1>Error Loading Map</h1><p>There was an error loading the map. Please try again later.</p></body></html>',
            mimeType: 'text/html',
            encoding: 'utf8',
          );
        },
      ),
    );
  }
}