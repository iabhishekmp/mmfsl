import '../../calendar/data/models/user_models.dart';
import '../../calendar/data/models/users_tally_model.dart';
import '../enums/calendar_enums.dart';

extension UsersExtensions on List<User> {
  int totalByTab(CalendarTabs tab) {
    return byTab(tab).length;
  }

  List<User> byTab(CalendarTabs tab) {
    return switch (tab) {
      CalendarTabs.all => this,
      CalendarTabs.hrd => getHRD,
      CalendarTabs.tech1 => getTech1,
      CalendarTabs.followUp => getFollowUps,
    };
  }

  List<User> get getHRD {
    return where((element) => element.type == CalendarTabs.hrd).toList();
  }

  List<User> get getTech1 {
    return where((element) => element.type == CalendarTabs.tech1).toList();
  }

  List<User> get getFollowUps {
    return where((element) => element.type == CalendarTabs.followUp).toList();
  }
}

extension UsersTallyExtensions on List<UsersTallyModel> {
  int byTab(CalendarTabs tab) {
    return switch (tab) {
      CalendarTabs.all => total,
      CalendarTabs.hrd => totalHRD,
      CalendarTabs.tech1 => totalTech1,
      CalendarTabs.followUp => totalFollowUps,
    };
  }

  int get total {
    return totalHRD + totalTech1 + totalFollowUps;
  }

  int get totalHRD {
    return fold(0, (p, e) => p + e.hrd);
  }

  int get totalTech1 {
    return fold(0, (p, e) => p + e.tech1);
  }

  int get totalFollowUps {
    return fold(0, (p, e) => p + e.followUp);
  }
}
