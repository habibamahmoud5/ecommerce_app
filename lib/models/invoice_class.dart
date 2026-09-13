
import 'package:ecommerce_app/screens/cart.dart';

class InvoiceClass {
  // int subTotal =0;
  int get subTotal => preSum.reduce((a, b) => a + b);
  int shippingFee = 80;
  List<int> preSum = cartProducts
      .map(((e) => (e.price ?? 0) * e.count))
      .toList();
  int get total => shippingFee+subTotal;
}