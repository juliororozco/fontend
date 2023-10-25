import 'package:get/get.dart';
import 'package:frontend/data/services/productService.dart';
import 'package:frontend/domain/models/products.dart';

class ProductController extends GetxController {
  Rx<List<Product>> listaLocalP = Rx<List<Product>>([]);
  late final ProductService productService;
  Future<void> listProducts() async {
    listaLocalP.value = await ProductService.getProducts();
    listaLocalP.refresh();
    print(listaLocalP.value);
  }

/*
  Future<void> createProduct(Product product) async {
    var body = product.toJson();
    await ProductService.postProduct(body as Product);
    listaLocalP.refresh();
  }

  Future<void> oneProduct(int id) async {
    await ProductService.getProduct(id);
    listaLocalP.refresh();
  }

  Future<void> search(String key) async {
    listaLocalP.value = await ProductService.searchProduct(key);
    listaLocalP.refresh();
  }

*/
  List<Product> get listaGeneralProduct => listaLocalP.value;
}
