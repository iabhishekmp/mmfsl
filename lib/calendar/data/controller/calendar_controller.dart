import 'package:get/get.dart';

import '../infrastructure/users_infra.dart';
import '../models/user_models.dart';

final kCalendarController = Get.put(CalendarController(UsersInfra()));

class CalendarController extends GetxController {
  CalendarController(this._infra);
  final UsersInfra _infra;

  //? flags
  RxBool isFetching = false.obs;
  //? users list
  Rx<List<User>> users = Rx([]);

  Future<void> fetchDataByDay({
    required DateTime day,
  }) async {
    if (isFetching.value) return;
    isFetching.value = true;
    final u = await _infra.getUsersByDate(date: day);
    isFetching.value = false;
    users.value = u;
  }
}
