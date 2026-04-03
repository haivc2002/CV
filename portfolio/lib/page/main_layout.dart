import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  void _downloadCV() {
    // final anchor = html.AnchorElement(href: 'assets/ThanhHai_mobile.pdf')
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final anchor = html.AnchorElement(
        href: 'https://raw.githubusercontent.com/haivc2002/CV/main/assets/assets/ThanhHai_mobile.pdf?t=$timestamp')
      ..setAttribute('download', 'ThanhHai_mobile.pdf')
      ..style.display = 'none';
    html.document.body?.append(anchor);
    anchor.click();
    anchor.remove();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.jpg"),
          fit: BoxFit.fill
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(children: [
            TextButton(
              onPressed: () => context.go('/'),
              child: Text("ABOUT ME", style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600
              ))
            ),
            TextButton(
                onPressed: () => context.go('/projects'),
                child: Text('PROJECTS', style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600
                ))
            )
          ]),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: _downloadCV,
              child: Text("Download CV", style: TextStyle(color: Colors.white),)
            ),
            const SizedBox(width: 20),
          ],
          centerTitle: false,
        ),
        body: child,
      ),
    );
  }
}