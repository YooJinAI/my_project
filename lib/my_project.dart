// 상품 클래스 정의
class Product {
  final String name;
  final int price;

  Product(this.name, this.price);
}

// 쇼핑몰 클래스 정의
class ShoppingMall {
  // 판매하는 상품 목록
  final List<Product> products = [
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ];

  // 장바구니
  final List<CartItem> cart = [];

  // 장바구니 총액
  int totalAmount = 0;

  // 상품 목록을 출력하는 메서드
  String showProducts() {
    String result = '\n';
    for (var product in products) {
      result += '${product.name} / ${product.price}원\n';
    }
    return result;
  }

  // 상품을 장바구니에 담는 메서드
  String addToCart(String productName, int quantity) {
    try {
      // 상품 찾기
      if (!products.any((p) => p.name == productName)) {
        return '입력값이 올바르지 않아요 !';
      }

      // 수량 검사
      if (quantity <= 0) {
        return '0개보다 많은 개수의 상품만 담을 수 있어요 !';
      }

      // 상품 찾기
      Product product = products.firstWhere((p) => p.name == productName);

      // 장바구니에 담기
      CartItem item = CartItem(product, quantity);
      cart.add(item);

      // 총액 업데이트
      totalAmount += item.totalPrice;

      return '장바구니에 상품이 담겼어요 !';
    } catch (e) {
      return '입력값이 올바르지 않아요 !';
    }
  }

  // 장바구니에 담은 상품의 총 가격을 출력하는 메서드
  String showTotal() {
    if (cart.isEmpty) {
      return '장바구니에 담긴 상품이 없습니다.';
    }

    // 장바구니에 담긴 상품 이름 목록 생성
    List<String> productNames = cart.map((item) => item.product.name).toList();
    String productList = productNames.join(', ');

    return '장바구니에 ${productList}가 담겨있네요. 총 ${totalAmount}원 입니다!';
  }

  // 장바구니 초기화 메서드
  String clearCart() {
    if (cart.isEmpty) {
      return '이미 장바구니가 비어있습니다.';
    }

    cart.clear();
    totalAmount = 0;
    return '장바구니를 초기화합니다.';
  }

  // 프로그램 종료 메시지
  String getExitMessage() {
    return '이용해 주셔서 감사합니다 ~ 안녕히 가세요 !';
  }
}

// 장바구니 아이템 클래스 정의
class CartItem {
  final Product product;
  final int quantity;

  CartItem(this.product, this.quantity);

  int get totalPrice => product.price * quantity;
}
