import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo/common/cli_common.dart';

int useTimerSecond() {
  final count = useState(0);
  
  useEffect(() {
    final timer = Timer.periodic(1.seconds, (timer) {
      count.value = timer.tick;
    });

    return () => timer.cancel();
  }, []);
  return count.value;
}

