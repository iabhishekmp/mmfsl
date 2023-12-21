import 'package:get/get.dart';

import '../../../core/enums/calendar_enums.dart';
import '../infrastructure/users_infra.dart';
import '../models/user_models.dart';
import '../models/users_tally_model.dart';

final kCalendarController = Get.put(CalendarController(UsersInfra()));

class CalendarController extends GetxController {
  CalendarController(this._infra);
  final UsersInfra _infra;

  //? flags
  RxBool isFetching = false.obs;
  //? users list
  Rx<List<User>> users = Rx([]);
  //? users tally list
  Rx<List<UsersTallyModel>> usersTally = Rx([]);
  //? calendar view
  Rx<CalendarViews> calendarViews = Rx(CalendarViews.days);

  Future<void> fetchDataByDay({
    required DateTime day,
    DateTime? end,
  }) async {
    if (isFetching.value) return;
    isFetching.value = true;
    if (end != null) {
      final u = await _infra.getUsersByDateRange(
        start: day,
        end: end,
      );
      usersTally.value = u;
    } else {
      final u = await _infra.getUsersByDate(
        date: day,
      );
      users.value = u;
    }
    isFetching.value = false;
  }
}
