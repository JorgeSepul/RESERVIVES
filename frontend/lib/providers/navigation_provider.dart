import 'package:flutter_riverpod/flutter_riverpod.dart';

final servicesTabIndexProvider = NotifierProvider<ServicesTabIndexNotifier, int>(() {
  return ServicesTabIndexNotifier();
});

class ServicesTabIndexNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    if (state != index) {
      state = index;
    }
  }
}
