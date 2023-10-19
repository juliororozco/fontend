import 'package:get/get.dart';
import '../../data/services/productService.dart';
import '../../lib/domain/models/products.dart';

class ProductController extends GetxController {
  Rx<List<Product>> listaLocalP = Rx<List<Product>>([]);
  final ProductService productService;

  ProductController(this.productService);

  Future<void> listProducts() async {
    listaLocalP.value = await productService.getProducts();
    listaLocalP.refresh();
  }

  Future<Product> postProduct(Product product) async {
    return await productService.postProduct(product);
  }
  Future<Product> getProduct(int id) async {
    return await productService.getProduct(id);
  }

  Future<List<Product>> searchProduct(String key) async {
    return await productService.searchProduct(key);
  }

  List<Product> get listaGeneralProduct => listaLocalP.value;
}