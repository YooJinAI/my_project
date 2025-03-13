import 'dart:io';
import 'package:my_project/my_project.dart';

void main() {
  final mall = ShoppingMall();

  while (true) {
    print(
      '\n[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 초기화',
    );
    print(
      '-------------------------------------------------------------------------------------------------------',
    );

    String? input = stdin.readLineSync();

    if (input == null) continue;

    switch (input) {
      case '1':
        print(mall.showProducts());
        break;

      case '2':
        print('상품 이름을 입력해 주세요 !');
        String? productName = stdin.readLineSync();

        // 상품 이름 검증
        if (productName != null) {
          bool isValidProduct = mall.products.any((p) => p.name == productName);
          if (!isValidProduct) {
            print('입력값이 올바르지 않아요 !');
            break;
          }

          print('상품 개수를 입력해 주세요 !');
          String? quantityStr = stdin.readLineSync();

          if (quantityStr != null) {
            int? quantity = int.tryParse(quantityStr);
            if (quantity == null) {
              print('입력값이 올바르지 않아요 !');
            } else {
              print(mall.addToCart(productName, quantity));
            }
          }
        }
        break;

      case '3':
        print(mall.showTotal());
        break;

      case '4':
        print('정말 종료하시겠습니까?');
        String? confirmInput = stdin.readLineSync();

        if (confirmInput == '5') {
          print(mall.getExitMessage());
          return;
        } else {
          print('종료하지 않습니다.');
        }
        break;

      case '6':
        print(mall.clearCart());
        break;

      default:
        print('입력값이 올바르지 않아요 !');
    }
  }
}
