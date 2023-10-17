void changeQuantity(bool isIncrement, int quantity) {
  if (isIncrement) {
    quantity++;
  } else {
    if (quantity > 0) {
      quantity--;
    }
  }
}
