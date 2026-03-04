import 'dart:async';
import 'dart:ui' as ui;
import 'dart:html' as html;

import 'package:flutter/material.dart';

class ProjectDetail extends StatefulWidget {
  final ModelArgument args;
  const ProjectDetail({super.key, required this.args});

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  bool _isVietnamese = false;

  bool isPhone(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 600;
  }

  String get _description => _isVietnamese && widget.args.descriptionVi != null
      ? widget.args.descriptionVi!
      : widget.args.description;

  List<String> get _mainFeatures => _isVietnamese && widget.args.mainFeaturesVi.isNotEmpty
      ? widget.args.mainFeaturesVi
      : widget.args.mainFeatures;

  List<String> get _contribution => _isVietnamese && widget.args.contributionVi.isNotEmpty
      ? widget.args.contributionVi
      : widget.args.contribution;

  @override
  Widget build(BuildContext context) {
    final args = widget.args;
    final constraints = const BoxConstraints(maxWidth: 950);
    final bool showSourceProject = args.sourceAppstore != null
        || args.sourceCHplay != null
        || args.sourceGithub != null;

    final String featuresLabel = _isVietnamese ? "Tính năng" : "Features";
    final String contributionLabel = _isVietnamese ? "Đóng góp" : "Contribution";
    final String technologyLabel = _isVietnamese ? "Công nghệ" : "Technology";
    final String availableLabel = _isVietnamese ? "Tải ứng dụng" : "Available for User";
    final String teamSizeLabel = _isVietnamese ? "Quy mô nhóm: " : "Team size: ";

    return Scaffold(
      body: SelectionArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 100),
          child: Column(
          children: [
            MainColorImage(
              image: AssetImage(args.image),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ConstrainedBox(
                    constraints: constraints,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: AspectRatio(
                        aspectRatio: 2/1.1,
                        child: Image.asset(args.image, fit: BoxFit.cover,)
                      )
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ConstrainedBox(
                  constraints: constraints,
                  child: Column(
                    children: [
                      _buildLanguageToggle(),
                      const SizedBox(height: 16),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              width: 5,
                              child: ColoredBox(color: Colors.blueAccent),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(args.nameApp, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                                  if(args.temSize != null) Row(children: [
                                    Text(teamSizeLabel, style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text(args.temSize.toString()),
                                  ]),
                                  Text(_description),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: constraints,
                  child: isPhone(context) ? Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(_mainFeatures.isNotEmpty) Text(featuresLabel, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),),
                        ..._mainFeatures.map((e) {
                          return _mainFeatureWidget(e);
                        },),
                        if(_contribution.isNotEmpty) Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(contributionLabel, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                          ),),
                        ),
                        ..._contribution.map((e) {
                          return _mainFeatureWidget(e);
                        },),
                        if(args.technologies.isNotEmpty) Text(technologyLabel, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),
                        Wrap(
                          runSpacing: 10,
                          spacing: 10,
                          children: args.technologies.map((e) {
                            return _technologyItem(e);
                          },).toList()
                        ),
                        if(showSourceProject) Divider(color: Colors.black.withValues(alpha: 0.6),),
                        if(showSourceProject) Text(availableLabel, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),
                        Wrap(
                          runSpacing: 20,
                          spacing: 20,
                          children: [
                            if(args.sourceAppstore != null) GestureDetector(
                                onTap: () => html.window.open(args.sourceAppstore!, '_blank'),
                                child: Image.asset("assets/logo_appstore.png", height: 50, width: 50,)
                            ),
                            if(args.sourceCHplay != null) GestureDetector(
                                onTap: () => html.window.open(args.sourceCHplay!, '_blank'),
                                child: Image.asset("assets/logo_chplay.png", height: 50, width: 50)
                            ),
                            if(args.sourceGithub != null) GestureDetector(
                                onTap: () => html.window.open(args.sourceGithub!, '_blank'),
                                child: Image.asset("assets/logo_github.png", height: 50, width: 50)
                            )
                          ]
                        )
                      ],
                    ),
                  ) : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(_mainFeatures.isNotEmpty) Text(featuresLabel, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),
                        ..._mainFeatures.map((e) {
                          return _mainFeatureWidget(e);
                        },),
                        if(_contribution.isNotEmpty) Text(contributionLabel, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),
                        ..._contribution.map((e) {
                          return _mainFeatureWidget(e);
                        },),
                      ],
                    )
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        if(args.technologies.isNotEmpty) Text(technologyLabel, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),
                        Wrap(
                            runSpacing: 20,
                            spacing: 20,
                            children: args.technologies.map((e) {
                              return _technologyItem(e);
                            },).toList()
                        ),
                        if(showSourceProject) Divider(color: Colors.black.withValues(alpha: 0.6),),
                        if(showSourceProject) Text(availableLabel, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Wrap(
                              runSpacing: 20,
                              spacing: 20,
                              children: [
                                if(args.sourceAppstore != null) GestureDetector(
                                    onTap: () => html.window.open(args.sourceAppstore!, '_blank'),
                                    child: Image.asset("assets/logo_appstore.png", height: 50, width: 50,)
                                ),
                                if(args.sourceCHplay != null) GestureDetector(
                                    onTap: () => html.window.open(args.sourceCHplay!, '_blank'),
                                    child: Image.asset("assets/logo_chplay.png", height: 50, width: 50)
                                ),
                                if(args.sourceGithub != null) GestureDetector(
                                    onTap: () => html.window.open(args.sourceGithub!, '_blank'),
                                    child: Image.asset("assets/logo_github.png", height: 50, width: 50)
                                )
                              ]
                          ),
                        )
                      ],),
                    )
                  ]),
                ),
              ),
            )
          ],
                ),
        ),
      ),
    );
  }

  Widget _buildLanguageToggle() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.all(3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _langButton("EN", !_isVietnamese, () {
              setState(() => _isVietnamese = false);
            }),
            const SizedBox(width: 4),
            _langButton("VI", _isVietnamese, () {
              setState(() => _isVietnamese = true);
            }),
          ],
        ),
      ),
    );
  }

  Widget _langButton(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(22),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.blueAccent.withValues(alpha: 0.3), blurRadius: 6, offset: const Offset(0, 2))]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _mainFeatureWidget(String features) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.translate(
          offset: const Offset(0, -4),
          child: Text("• ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
        ),
        Expanded(child: Text(features)),
      ],
    );
  }

  Widget _technologyItem(Technology technology) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Image.asset(technology.logo, height: 50, width: 50,),
          const SizedBox(height: 5),
          Text(technology.name, style: TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }
}

class ModelArgument {
  final String image;
  final String description;
  final String? descriptionVi;
  final String nameApp;
  final List<String> mainFeatures;
  final List<String> mainFeaturesVi;
  final List<String> contribution;
  final List<String> contributionVi;
  final List<Technology> technologies;
  final String? sourceCHplay;
  final String? temSize;
  final String? sourceAppstore;
  final String? sourceGithub;

  const ModelArgument({
    required this.image,
    required this.description,
    this.descriptionVi,
    required this.nameApp,
    this.temSize,
    this.mainFeatures = const [],
    this.mainFeaturesVi = const [],
    this.contribution = const [],
    this.contributionVi = const [],
    this.technologies = const [],
    this.sourceCHplay,
    this.sourceAppstore,
    this.sourceGithub,
  });
}

class Technology {
  final String logo;
  final String name;

  const Technology({
    required this.logo,
    required this.name,
  });
}

class MainColorImage extends StatefulWidget {
  final ImageProvider image;
  final Widget child;

  const MainColorImage({
    super.key,
    required this.image,
    required this.child,
  });

  @override
  State<MainColorImage> createState() => _MainColorImageState();
}

class _MainColorImageState extends State<MainColorImage> {
  Color? _avgColor;

  @override
  void initState() {
    super.initState();
    _calculate();
  }

  Future<void> _calculate() async {
    final color = await _getAverageColor(widget.image);
    if (mounted) {
      setState(() => _avgColor = color);
    }
  }

  Future<Color> _getAverageColor(ImageProvider provider) async {
    final completer = Completer<ui.Image>();

    final stream = provider.resolve(const ImageConfiguration());
    final listener = ImageStreamListener((info, _) {
      completer.complete(info.image);
    });

    stream.addListener(listener);

    final image = await completer.future;

    final byteData =
    await image.toByteData(format: ui.ImageByteFormat.rawRgba);

    final pixels = byteData!.buffer.asUint8List();

    int r = 0, g = 0, b = 0;
    int count = 0;

    for (int i = 0; i < pixels.length; i += 4) {
      r += pixels[i];
      g += pixels[i + 1];
      b += pixels[i + 2];
      count++;
    }

    return Color.fromARGB(
      255,
      (r / count).round(),
      (g / count).round(),
      (b / count).round(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: _avgColor ?? Colors.white,
      child: widget.child,
    );
  }
}