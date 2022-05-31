import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loader<B extends StateStreamable<S>, S> extends StatelessWidget {

  final BlocWidgetSelector<S, bool> selector;

  const Loader({
    Key? key,
    required this.selector,
  }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return BlocSelector<B, S, bool>(
      selector: selector, 
      builder: (context, showLoader) {
        return Visibility(
          visible: showLoader,
          child: const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            )
          ),
        );
      }
    );
  }
}
