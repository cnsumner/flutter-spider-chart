// import 'package:flutter/cupertino.dart';
// import 'package:flutter_test/flutter_test.dart';

// // import 'package:integration_test/integration_test.dart';

// import '../lib/main.dart';

// void main() {
//   // final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   group('Take screenshots', () {
//     testWidgets('screenshot basic chart', (tester) async {
//       await tester.pumpWidget(const App());
//       await tester.pumpAndSettle();

//       final finder = find.byKey(const Key("button_default_chart"));

//       await tester.tap(finder);

//       await tester.pumpAndSettle();

//       await binding.convertFlutterSurfaceToImage();

//       await tester.pumpAndSettle();

//       await binding.takeScreenshot('default_chart');
//     });

//     testWidgets('screenshot chart with labels', (tester) async {
//       await tester.pumpWidget(const App());
//       await tester.pumpAndSettle();

//       final finder = find.byKey(const Key("button_chart_with_labels"),
//           skipOffstage: false);

//       await tester.tap(finder);

//       await tester.pumpAndSettle();

//       await binding.convertFlutterSurfaceToImage();

//       await tester.pumpAndSettle();

//       await binding.takeScreenshot('chart_with_labels');
//     });

//     testWidgets('screenshot chart with max value', (tester) async {
//       await tester.pumpWidget(const App());
//       await tester.pumpAndSettle();

//       final finder = find.byKey(const Key("button_chart_with_max_value"),
//           skipOffstage: false);

//       await tester.tap(finder);

//       await tester.pumpAndSettle();

//       await binding.convertFlutterSurfaceToImage();

//       await tester.pumpAndSettle();

//       await binding.takeScreenshot('chart_with_max_value');
//     });

//     testWidgets('screenshot chart with custom colors', (tester) async {
//       await tester.pumpWidget(const App());
//       await tester.pumpAndSettle();

//       final finder = find.byKey(const Key("button_chart_with_custom_colors"),
//           skipOffstage: false);

//       await tester.tap(finder);

//       await tester.pumpAndSettle();

//       await binding.convertFlutterSurfaceToImage();

//       await tester.pumpAndSettle();

//       await binding.takeScreenshot('chart_with_custom_colors');
//     });

//     testWidgets('screenshot chart with color swatch', (tester) async {
//       await tester.pumpWidget(const App());
//       await tester.pumpAndSettle();

//       final finder = find.byKey(const Key("button_chart_with_color_swatch"),
//           skipOffstage: false);

//       await tester.tap(finder);

//       await tester.pumpAndSettle();

//       await binding.convertFlutterSurfaceToImage();

//       await tester.pumpAndSettle();

//       await binding.takeScreenshot('chart_with_color_swatch');
//     });
//   });
// }
