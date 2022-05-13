import 'package:clone_tools/clone_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Demo card", () {
    testWidgets("golden with all sizes", (WidgetTester tester) async {
      tester.binding.window
        ..physicalSizeTestValue = const Size(1200, 1000)
        ..devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      DemoCard.wide(
                        background: cardBackground,
                        child: SizedBox(),
                      ),
                      SizedBox(height: 24),
                      DemoCard.square(
                        background: cardBackground,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                  const SizedBox(width: 24),
                  const DemoCard.tall(
                    background: cardBackground,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(find.byType(MaterialApp), matchesGoldenFile("demo_card_variety.png"));
    });
  });
}

const cardBackground = Color(0xFF120821);
