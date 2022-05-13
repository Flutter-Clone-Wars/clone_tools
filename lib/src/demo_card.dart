import 'package:flutter/material.dart';

/// Card that displays the given [child] with the given [background] color.
///
/// [DemoCard]s come in a number of pre-configured sizes.
class DemoCard extends StatelessWidget {
  const DemoCard.wide({
    Key? key,
    required this.background,
    this.elevation = 0.0,
    required this.child,
  })  : constraints = const BoxConstraints(maxWidth: 500, maxHeight: 300),
        aspectRatio = null,
        super(key: key);

  const DemoCard.tall({
    Key? key,
    required this.background,
    this.elevation = 0.0,
    required this.child,
  })  : constraints = const BoxConstraints(maxWidth: 500, maxHeight: 800),
        aspectRatio = null,
        super(key: key);

  const DemoCard.square({
    Key? key,
    required this.background,
    this.elevation = 0.0,
    required this.child,
  })  : constraints = const BoxConstraints(maxWidth: 500, maxHeight: 500),
        aspectRatio = 1.0,
        super(key: key);

  final Color background;
  final BoxConstraints constraints;
  final double? aspectRatio;
  final double elevation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );

    final Widget cardWithAspectRatio;
    if (aspectRatio != null) {
      cardWithAspectRatio = AspectRatio(
        aspectRatio: aspectRatio!,
        child: card,
      );
    } else {
      cardWithAspectRatio = card;
    }

    return RepaintBoundary(
      child: ConstrainedBox(
        constraints: constraints,
        child: cardWithAspectRatio,
      ),
    );
  }
}
