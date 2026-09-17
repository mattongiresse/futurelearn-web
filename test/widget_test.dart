import 'package:flutter_test/flutter_test.dart';
import 'package:futurelean_and_service/main.dart';

void main() {
  testWidgets('App démarre correctement', (WidgetTester tester) async {
    await tester.pumpWidget(const FutureleanApp());
    expect(find.text('FUTURELEAN AND SERVICE'), findsOneWidget);
  });
}