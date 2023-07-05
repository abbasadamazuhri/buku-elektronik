import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewerPage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<ViewerPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Wrap(
                          spacing: 200,
                          runSpacing: 10,
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    }),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                    icon: const Icon(
                                      Icons.search_off_outlined,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    }),
                              ],
                            )
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 20),
                        child: Center(
                            child: SfPdfViewer.network(
                                'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                                canShowScrollHead: false,
                                canShowScrollStatus: false))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
