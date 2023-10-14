import 'package:nobitok/data/models/service.dart';

void changeQuantity(bool isIncrement, Service service) {
  int quantity = service.serviceQuantity!;
  isIncrement ? quantity++ : quantity--;
}
