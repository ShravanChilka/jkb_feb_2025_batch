import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/counter_one_text_widget.dart';
import 'package:jkb_feb_2025_batch/counter_two_text_widget.dart';
import 'package:jkb_feb_2025_batch/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('build method called');
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Reset'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.red.shade100,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CounterOneTextWidget(),
                      TextButton(
                        onPressed: () {
                          context
                              .read<CounterViewModel>()
                              .incrementCounterOne();
                        },
                        child: Text('Increment counter one'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue.shade100,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CounterTwoTextWidget(),
                      TextButton(
                        onPressed: () {
                          context
                              .read<CounterViewModel>()
                              .incrementCounterTwo();
                        },
                        child: Text('Increment counter two'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
