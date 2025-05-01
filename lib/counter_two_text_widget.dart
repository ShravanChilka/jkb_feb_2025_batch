import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterTwoTextWidget extends StatelessWidget {
  const CounterTwoTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<CounterViewModel, int>(
      selector: (context, viewModel) => viewModel.counterTwo,
      builder: (context, counter, child) {
        print('counterTwo text widget built');
        return Text(
          counter.toString(),
          style: Theme.of(context).textTheme.displayLarge,
        );
      },
    );
  }
}
