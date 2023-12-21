import 'package:mock_data/mock_data.dart';

import '../../../core/enums/calendar_enums.dart';
import '../models/user_models.dart';

class UsersInfra {
  Future<List<User>> getUsersByDate({required DateTime date}) async {
    //? faking api call
    await Future<void>.delayed(const Duration(seconds: 1));

    //? generating mock data
    final n = mockInteger(1, 15);
    return List.generate(
      n,
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
      ),
    );
  }
}
