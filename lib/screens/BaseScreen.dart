import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../Locator.dart';
import 'BaseViewModel.dart';

class BaseScreen<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child)? builder;
  final Function(T)? onModelReady;
  final Function(T)? afterModelReady;
  final Function()? onFinish;

  BaseScreen({this.builder, this.onModelReady, this.onFinish, this.afterModelReady});

  @override
  _BaseScreenState<T> createState() => _BaseScreenState<T>();
}

class _BaseScreenState<T extends BaseViewModel> extends State<BaseScreen<T>> {
  T model = locator<T>();

  @override
  void initState() {
    super.initState();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        if (widget.onModelReady != null) {
          widget.onModelReady!(model);
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.afterModelReady != null) {
      widget.afterModelReady!(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (context) => model,
        child: Consumer<T>(builder: widget.builder!));
  }
}