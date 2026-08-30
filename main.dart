import 'package:flutter/material.dart';

void main() => runApp(const ViraApp());

class ViraApp extends StatelessWidget {
  const ViraApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ویرا',
      theme: ThemeData(useMaterial3: true, fontFamily: 'sans-serif', colorSchemeSeed: const Color(0xFFC89B3C)),
      home: const ViraHome(),
    );
  }
}

class ViraHome extends StatelessWidget {
  const ViraHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F4EC),
        appBar: AppBar(
          backgroundColor: const Color(0xFF111111),
          foregroundColor: const Color(0xFFD7AF55),
          title: const Text('ویرا | VIRA', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: const Color(0xFF111111), borderRadius: BorderRadius.circular(24)),
              child: const Column(children: [
                Icon(Icons.monetization_on_outlined, size: 72, color: Color(0xFFD7AF55)),
                SizedBox(height: 10),
                Text('طلا آبشده و سکه ویرا', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('قیمت‌ها و خدمات طلا و سکه', style: TextStyle(color: Color(0xFFD7AF55), fontSize: 15)),
              ]),
            ),
            const SizedBox(height: 18),
            const _PriceCard(title: 'طلای آبشده', value: 'برای مشاهده قیمت لحظه‌ای'),
            const _PriceCard(title: 'سکه امامی', value: 'برای مشاهده قیمت لحظه‌ای'),
            const _PriceCard(title: 'سکه بهار آزادی', value: 'برای مشاهده قیمت لحظه‌ای'),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Text('درباره ویرا', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('خرید و فروش طلای آبشده و سکه با تمرکز بر شفافیت و اعتماد.'),
                  SizedBox(height: 12),
                  Text('قم، خیابان ارم، پاساژ الغدیر، طبقه اول، پلاک ۶۹'),
                ]),
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'خانه'),
          NavigationDestination(icon: Icon(Icons.show_chart), label: 'قیمت‌ها'),
          NavigationDestination(icon: Icon(Icons.phone_outlined), label: 'تماس'),
        ]),
      ),
    );
  }
}

class _PriceCard extends StatelessWidget {
  final String title, value;
  const _PriceCard({required this.title, required this.value});
  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: const CircleAvatar(backgroundColor: Color(0xFFE8D39C), child: Icon(Icons.circle, color: Color(0xFFC89B3C))),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
      trailing: const Icon(Icons.chevron_left),
    ),
  );
}
