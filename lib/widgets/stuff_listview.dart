import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StuffListView extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool loading;

  const StuffListView({
    Key key,
    this.itemCount,
    this.itemBuilder,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (itemCount == 0) {
      return Center(
        child: Text(
          'Sem empréstimos',
          style: TextStyle(color: Colors.black45),
        ),
      );
    }

    return AnimationLimiter(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
