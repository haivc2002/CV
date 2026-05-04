import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainLayout({super.key, required this.navigationShell});

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

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;

    return DecoratedBox(
      decoration: const BoxDecoration(
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
              onPressed: () => _onTap(0),
              child: Text("ABOUT ME", style: TextStyle(
                color: currentIndex == 0 ? Colors.blueAccent : Colors.black,
                fontWeight: currentIndex == 0 ? FontWeight.bold : FontWeight.w600,
                decoration: currentIndex == 0 ? TextDecoration.underline : null,
              ))
            ),
            TextButton(
                onPressed: () => _onTap(1),
                child: Text('PROJECTS', style: TextStyle(
                  color: currentIndex == 1 ? Colors.blueAccent : Colors.black,
                  fontWeight: currentIndex == 1 ? FontWeight.bold : FontWeight.w600,
                  decoration: currentIndex == 1 ? TextDecoration.underline : null,
                ))
            )
          ]),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: _downloadCV,
              child: const Text("Download CV", style: TextStyle(color: Colors.white),)
            ),
            const SizedBox(width: 20),
          ],
          centerTitle: false,
        ),
        body: navigationShell,
      ),
    );
  }
}