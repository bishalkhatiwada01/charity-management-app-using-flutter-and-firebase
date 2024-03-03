// import 'package:charity_management_app/common/widgets/custom_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() {
//   testWidgets('CustomAppBar displays the correct title',
//       (WidgetTester tester) async {
//     // Mock the dependencies
//     final String title = 'Test Title';
//
//     // Build the widget
//     await tester.pumpWidget(
//       MaterialApp(
//         home: Scaffold(
//           appBar: CustomAppBar(title: title),
//         ),
//       ),
//     );
//
//     // Verify the title is displayed correctly
//     expect(find.text(title), findsOneWidget);
//   });
// }



import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:charity_management_app/common/widgets/my_button.dart';

void main() {
  testWidgets('MyButton can be tapped and triggers onTap function', (WidgetTester tester) async {
    bool wasTapped = false;

    // Build the MyButton widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MyButton(
            text: 'Test',
            onTap: () {
              wasTapped = true;
            },
          ),
        ),
      ),
    );

    // Find the MyButton widget
    final myButton = find.byType(MyButton);
    expect(myButton, findsOneWidget);

    // Tap on the MyButton widget
    await tester.tap(myButton);
    await tester.pump();

    // Verify that the onTap function was triggered
    expect(wasTapped, isTrue);
  });
}