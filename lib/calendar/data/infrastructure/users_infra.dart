import 'package:mock_data/mock_data.dart';

import '../../../core/enums/calendar_enums.dart';
import '../models/user_models.dart';
import '../models/users_tally_model.dart';

class UsersInfra {
  List<User> _getUsers(DateTime date, [int? count]) {
    //? generating mock data
    final n = mockInteger(1, 15);
    return List.generate(
      count ?? n,
      (index) => User(
        id: mockUUID().substring(0, 16),
        name: mockName(),
        offered: mockInteger(100000, 1000000).toDouble(),
        current: mockInteger(100000, 1000000).toDouble(),
        priority: mockInteger(0, 2).priority,
        dueDate: mockDate(DateTime(2020)),
        level: mockInteger(),
        daysLeft: mockInteger(1, 100),
        phone: '+9198765${mockInteger(10000, 99999)}',
        type: mockInteger(1, 3).type,
        date: date,
      ),
    );
  }

  Future<List<User>> getUsersByDate({
    required DateTime date,
  }) async {
    //? faking api call
    await Future<void>.delayed(const Duration(seconds: 1));
    return _getUsers(date);
  }

  Future<List<UsersTallyModel>> getUsersByDateRange({
    required DateTime start,
    required DateTime end,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final result = <UsersTallyModel>[];
    final n = end.difference(start).inDays;
    for (var i = 0; i < n + 1; i++) {
      result.add(
        UsersTallyModel(
          date: start.add(Duration(days: i)),
          priority: mockInteger(0, 2).priority,
          type: mockInteger(1, 3).type,
          hrd: mockInteger(1, 15),
          tech1: mockInteger(1, 15),
          followUp: mockInteger(1, 15),
        ),
      );
    }
    return result;
  }
}
