import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/number_trivia_bloc.dart';

class TriviaControls extends StatefulWidget {
  const TriviaControls({
    Key? key,
  }) : super(key: key);

  @override
  State<TriviaControls> createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final contoller = TextEditingController();
  late String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TextField
        TextField(
            controller: contoller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Input a number'),
            onChanged: (value) {
              inputStr = value;
            },
            onSubmitted: (_) =>
                contoller.text.isNotEmpty ? addConcrete() : null),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child: ElevatedButton(
              onPressed: addConcrete,
              child: const Text('Search'),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade300, onPrimary: Colors.black),
              onPressed: addRandom,
              child: const Text('Get random trivia'),
            )),
          ],
        )
      ],
    );
  }

  void addConcrete() {
    contoller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetTriviaForConcreteNumber(inputStr));
  }

  void addRandom() {
    contoller.clear();
    BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForRandomNumber());
  }
}
