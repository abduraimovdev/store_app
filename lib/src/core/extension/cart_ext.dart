import 'package:store_app/src/data/models/cart_item_model.dart';

extension CartExt on List<CartItem> {
  int? cartContain(String id) {
    for(int i = 0;i< length; i++) {
      if(this[i].id == id) {
        return i;
      }
    }
    return null;
  }
}
