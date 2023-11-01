import 'package:nobitok/data/services/post_end_of_day_service.dart';

import '../../constants/strings.dart';

class PostEndOfDayRepository {
  final PostEndOfDayService postEndOfDayService;

  PostEndOfDayRepository(this.postEndOfDayService);

  Future<bool> sendEndOfDay(String cash, String credit) async {
    final response = await postEndOfDayService.postEndOfDay(
      cash,
      credit,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Send end of day Status Code: ${response.statusCode}');
      print('Send end of day Body: ${response.body}');
      throw Exception('$kSendEndOfDayException:${response.body}');
    }
  }
}
