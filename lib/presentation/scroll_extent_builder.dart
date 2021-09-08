import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScrollExtentBuilder extends HookWidget {
  const ScrollExtentBuilder({Key? key, required this.builder}) : super(key: key);

  final Widget Function(
    BuildContext context,
    ScrollController scrollController,
    bool isOnTop,
    bool isOnBottom,
  ) builder;

  @override
  Widget build(BuildContext context) {
    final isOnTop = useState(true);
    final isOnBottom = useState(false);

    final scrollController = useScrollController();

    useEffect(() {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        if (!scrollController.hasClients) {
          return;
        }
        isOnBottom.value = scrollController.position.maxScrollExtent == 0;
      });
    }, []);

    bool handleScrollNotification(ScrollNotification notification) {
      isOnTop.value = notification.metrics.extentBefore == 0;
      isOnBottom.value = notification.metrics.extentAfter == 0;
      return true;
    }

    return NotificationListener<ScrollUpdateNotification>(
      onNotification: handleScrollNotification,
      child: builder(
        context,
        scrollController,
        isOnTop.value,
        isOnBottom.value,
      ),
    );
  }
}
