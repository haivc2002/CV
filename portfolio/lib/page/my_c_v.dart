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
    final doc = await PdfDocument.openAsset('assets/ThanhHai_mobile.pdf');
    setState(() => _doc = doc);
    _preRenderAllPages(doc);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              heightFactor: 0.955,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: cachedImage != null ? SizedBox(
                  height: index == 1 ? 270 : null,
                  width: double.infinity,
                  child: Image.memory(
                    cachedImage,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ) : const SizedBox(
                  height: 400,
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          );
        },
      )
    );

  }
}