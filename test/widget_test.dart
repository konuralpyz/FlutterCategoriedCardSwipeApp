import 'package:allahimakurdumsonunda/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Category Widget Test', (WidgetTester tester) async {
    // MyApp'i test edebilmek için ilk önce widget ağacını oluşturuyoruz.
    await tester.pumpWidget(MyApp());

    // Kategori isimlerini bir listeye kaydediyoruz.
    List<String> categoryNames = [
      'Category1',
      'Category2',
      'Category3',
      'Category4',
      'Category5',
      'Category6',
      'Category7',
      'Category8'
    ];

    // Her bir kategoriyi kontrol ediyoruz.
    for (String categoryName in categoryNames) {
      // Kategori ismini arıyoruz.
      expect(find.text(categoryName), findsOneWidget);

      // Kategori dokunulabilir mi diye kontrol ediyoruz.
      expect(find.text(categoryName).hitTestable(), findsOneWidget);

      // Kategoriye dokunuyoruz ve bekleme süresi ayarlıyoruz.
      await tester.tap(find.text(categoryName));
      await tester.pumpAndSettle();

      // Kategori sayfasının yüklendiğini kontrol ediyoruz.
      expect(find.text('$categoryName Kategorisi'), findsOneWidget);

      // Geri butonuna dokunuyoruz ve bekleme süresi ayarlıyoruz.
      await tester.tap(find.byTooltip('Geri'));
      await tester.pumpAndSettle();
    }
  });
}
