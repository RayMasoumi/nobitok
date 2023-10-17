void changeQuantity(bool isIncrement, int quantity) {
  if (isIncrement) {
    quantity++;
  } else {
    if (quantity > 0) {
      quantity--;
    }
  }
  if (widget.quantity > 1) {
    widget.onQuantityChanged(widget.quantity - 1);
  }
}
