import 'dart:html' as html;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdfx/pdfx.dart';

class MyCV extends StatefulWidget {
  const MyCV({super.key});

  @override
  State<MyCV> createState() => _MyCVState();
}

class _MyCVState extends State<MyCV> {

  PdfDocument? _doc;
  final Map<int, Uint8List> _pageCache = {};
  List<String> detectedLinks = [];
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final url = 'https://raw.githubusercontent.com/haivc2002/CV/main/assets/assets/ThanhHai_mobile.pdf?t=$timestamp';
      
      final request = await html.HttpRequest.request(
        url,
        responseType: 'arraybuffer',
      );
      
      if (request.status == 200) {
        final bytes = Uint8List.view(request.response as ByteBuffer);
        final doc = await PdfDocument.openData(bytes);
        setState(() => _doc = doc);
        _preRenderAllPages(doc);
      } else {
        throw Exception('Failed to load PDF: ${request.status}');
      }
    } catch (e) {
      debugPrint('Error loading CV from network: $e');
      // Fallback to asset if network fails
      final doc = await PdfDocument.openAsset('assets/ThanhHai_mobile.pdf');
      setState(() => _doc = doc);
      _preRenderAllPages(doc);
    }
  }

  Future<void> _preRenderAllPages(PdfDocument doc) async {
    for (int i = 1; i <= doc.pagesCount; i++) {
      if (!_pageCache.containsKey(i)) {
        await _renderPage(i);
        if (mounted) setState(() {});
      }
    }
  }

  Future<Uint8List> _renderPage(int pageNumber) async {
    if (_pageCache.containsKey(pageNumber)) {
      return _pageCache[pageNumber]!;
    }
    final page = await _doc!.getPage(pageNumber);
    final image = await page.render(
      width: page.width * 2,
      height: page.height * 2,
      format: PdfPageImageFormat.png,
    );
    await page.close();
    final bytes = image!.bytes;
    _pageCache[pageNumber] = bytes;
    return bytes;
  }

  Widget _areaLink(String link) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            html.window.open(link, '_blank');
          },
          child: Material(color: Colors.transparent)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 1.0,
      maxScale: 2.0,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _doc == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          addAutomaticKeepAlives: true,
          itemCount: _doc!.pagesCount,
          itemBuilder: (context, index) {
            final pageNum = index + 1;
            final cachedImage = _pageCache[pageNum];

            return Center(
              child: Align(
                heightFactor: 0.98,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: cachedImage != null ? LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      final height = index == 1 ? width * 5 / 12 : null;

                      return Stack(
                        children: [
                          SizedBox(
                            width: width,
                            height: height,
                            child: Image.memory(
                              cachedImage,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          if(index == 0) Positioned(
                            width: width/4.7,
                            height: width/38,
                            top: width/8.7,
                            right: width/3.7,
                            child: _areaLink("https://github.com/haivc2002")
                          ),
                          if(index == 0) Positioned(
                              width: width/3.5,
                              height: width/38,
                              top: width/1.135,
                              left: width/13,
                              child: _areaLink("https://haivc2002.github.io/CV/#/projects")
                          ),
                          if(index == 0) Positioned(
                              width: width/3.5,
                              height: width/38,
                              top: width/1.02,
                              left: width/13,
                              child: _areaLink("https://pub.dev/packages/fog_edge_blur")
                          ),
                          if(index == 0) Positioned(
                              width: width/3.5,
                              height: width/38,
                              top: width/0.865,
                              left: width/11,
                              child: _areaLink("https://pub.dev/packages/flow_box_popup")
                          ),
                          if(index == 0) Positioned(
                              width: width/3.9,
                              height: width/38,
                              top: width/0.754,
                              left: width/11,
                              child: _areaLink("https://pub.dev/packages/fluid_wave")
                          )
                        ],
                      );
                    },
                  ) : const SizedBox(),
                ),
              ),
            );
          },
        )
      ),
    );

  }
}