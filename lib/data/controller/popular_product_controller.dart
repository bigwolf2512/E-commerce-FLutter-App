import 'package:ecommerceshop/data/controller/auth_controller.dart';
import 'package:ecommerceshop/data/controller/cart_controller.dart';
import 'package:ecommerceshop/data/repo/popular_product_repo.dart';
import 'package:ecommerceshop/models/cart_model.dart';
import 'package:get/get.dart';
import '../../models/popular_product_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo productRepo;
  PopularProductController({required this.productRepo});

  List<dynamic> _popularproductList = [];
  List<dynamic> get popularproductList => _popularproductList;

  Future getpopularproductList() async {
    Response response = await productRepo.getPopularProductRepo();
    if (response.statusCode == 200) {
      _popularproductList = [];
      _popularproductList
          .addAll(ProductModel.fromJson(response.body).products!);
    } else {}
    update();
  }

  int _quantity = 1;
  int get quantity => _quantity;
  int _incartItems = 0;
  int get incartItems => _incartItems;
  bool descrement = false;
  late CartController _cart;

  void addQuantity(descrement) {
    if (descrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int _quantity) {
    if (_quantity < 1) {
      return 1;
    }

    return _quantity;
  }

  List<CartModel> get itemsObject {
    return _cart.getCartItems;
  }

  final bool _checkRemove = false;
  bool get checkRemove => _checkRemove;

  initQuantity() {
    _quantity = 1;
  }

  void initQuantitySource(int productID, CartController cart) {
    _incartItems = 0;
    _cart = cart;
    bool _exist;
    _exist = _cart.existItems(productID);
    if (_exist) {
      _incartItems = _cart.getQuantity(productID);
    } else {
      _incartItems = 0;
    }
  }

  void addItems(int productID, Products product) {
    String incartQuantity =
        (_cart.getQuantity(productID) + _quantity).toString();
    String buyerId = Get.find<AuthController>().userData.id.toString();
    String productId = productID.toString();

    _cart.addItems(product, _quantity);
    _cart.storeTransactions(incartQuantity, buyerId, productId, _quantity);
    bool _exist = _cart.existItems(productID);
    if (_exist) {
      _incartItems = _cart.getQuantity(productID);
    } else {
      _incartItems = 0;
    }
    update();
  }
}
