import 'package:flutter/material.dart';

void main() {
  runApp(const ViraApp());
}

class ViraApp extends StatelessWidget {
  const ViraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VIRA',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'sans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4AF37),
        ),
      ),
      home: const ViraHomePage(),
    );
  }
}

class ViraHomePage extends StatelessWidget {
  const ViraHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: AppBar(
          backgroundColor: const Color(0xFF111111),
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'VIRA',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF111111),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ویرا',
                      style: TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'خرید و فروش طلا و دلار',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                'قیمت لحظه‌ای',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _priceCard(
                title: 'طلای آبشده',
                price: '۷,۵۰۰,۰۰۰ تومان',
                icon: Icons.monetization_on,
              ),

              const SizedBox(height: 12),

              _priceCard(
                title: 'دلار آمریکا',
                price: '۹۵,۰۰۰ تومان',
                icon: Icons.attach_money,
              ),

              const SizedBox(height: 22),

              Row(
                children: [
                  Expanded(
                    child: _actionButton(
                      context,
                      'خرید طلا',
                      Icons.shopping_cart,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _actionButton(
                      context,
                      'فروش طلا',
                      Icons.sell,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _actionButton(
                      context,
                      'خرید دلار',
                      Icons.currency_exchange,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _actionButton(
                      context,
                      'فروش دلار',
                      Icons.account_balance_wallet,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                'خدمات ویرا',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _serviceTile(
                Icons.history,
                'سوابق معاملات',
              ),
              _serviceTile(
                Icons.calculate,
                'محاسبه قیمت طلا',
              ),
              _serviceTile(
                Icons.support_agent,
                'پشتیبانی ویرا',
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: const Color(0xFFD4AF37),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'خانه',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              label: 'قیمت‌ها',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'حساب کاربری',
            ),
          ],
        ),
      ),
    );
  }

  static Widget _priceCard({
    required String title,
    required String price,
    required IconData icon,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFD4AF37).withOpacity(.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: const Color(0xFFD4AF37),
                size: 30,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF555555),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_back_ios_new,
              size: 17,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _actionButton(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    return ElevatedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title در نسخه اولیه فعال است'),
          ),
        );
      },
      icon: Icon(icon),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFD4AF37),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  static Widget _serviceTile(
    IconData icon,
    String title,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFFD4AF37),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_back_ios_new, size: 16),
      ),
    );
  }
}
