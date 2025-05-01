import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterOneTextWidget extends StatelessWidget {
  const CounterOneTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterViewModel>(
      builder: (context, viewModel, child) {
        final counterOne = viewModel.counterOne;
        print('counterOne text widget built');
        return Text(
          counterOne.toString(),
          style: Theme.of(context).textTheme.displayLarge,
        );
      },
    );
  }
}
