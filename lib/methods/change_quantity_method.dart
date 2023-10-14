import 'package:nobitok/data/models/service.dart';

void changeQuantity(bool isIncrement, Service service) {
  if (isIncrement) {
    service.serviceQuantity++;
  } else {
    if (service.serviceQuantity > 0) {
      service.serviceQuantity--;
    }
  }
}
