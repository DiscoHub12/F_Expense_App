import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../principal_page.dart';

/// This class provides a default implementation
/// of the Widget that indicates the Star valutate.
/// This class (Object) is called into the InfoPage.
class StarsDisplay extends StatelessWidget {
  //Variables:
  final int value;

  //Constructor:
  const StarsDisplay({Key? key, this.value = 0}) : super(key: key);

  //Widget that create the Star valutate into the App.
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: Colors.orange,
        );
      }),
    );
  }
}

/// Class that represents the object,
/// then the page that will represent
/// the application information page.
class InfoPage extends State<HomePage> {
  //Variables
  final StarsDisplay _stars = const StarsDisplay();

  //Build the effective Class Widget (InfoPage).
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _welcome(),
          const SizedBox(height: 5),
          _fullText(),
          const SizedBox(height: 12),
          _stars.build(context),
        ],
      ),
    );
  }

  /// For simplicity, without having
  /// to instantiate and create objects
  /// directly within the build method,
  /// they are created out separately for a simpler
  /// code structure and modular.

  Widget _welcome() => SizedBox(
        height: 128,
        child: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText(
              'WELCOME TO EXPENSE APP',
              textStyle: const TextStyle(
                  height: 5,
                  fontSize: 20,
                  fontFamily: 'Rale way',
                  color: Colors.orange),
              textAlign: TextAlign.center,
            ),
          ],
          isRepeatingAnimation: true,
        ),
      );

  Widget _fullText() => const Text(
        'Welcome to the Expense App.\n'
        'Through this app, you will be able \n'
        'to create shopping lists or keep notes \n'
        ' on yout weekly expenses.\n'
        ' To create a new List, you can go to \n'
        ' + add pages.',
        style: TextStyle(fontSize: 15),
      );
}
