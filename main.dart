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
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0B0B),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4AF37),
          brightness: Brightness.dark,
        ),
        fontFamily: 'sans',
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class MarketItem {
  final String title;
  final String subtitle;
  final String price;
  final String unit;
  final IconData icon;
  final bool up;

  const MarketItem({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.unit,
    required this.icon,
    required this.up,
  });
}

const market = [
  MarketItem(
    title: 'طلای ۱۸ عیار',
    subtitle: 'هر گرم',
    price: '۷,۸۵۰,۰۰۰',
    unit: 'تومان',
    icon: Icons.circle,
    up: true,
  ),
  MarketItem(
    title: 'سکه امامی',
    subtitle: 'قطعه',
    price: '۹۲,۵۰۰,۰۰۰',
    unit: 'تومان',
    icon: Icons.monetization_on_outlined,
    up: true,
  ),
  MarketItem(
    title: 'دلار',
    subtitle: 'هر واحد',
    price: '۱۰۴,۵۰۰',
    unit: 'تومان',
    icon: Icons.attach_money,
    up: false,
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = const [
    HomeTab(),
    TradeTab(),
    OrdersTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(child: pages[index]),
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (value) => setState(() => index = value),
          backgroundColor: const Color(0xFF111111),
          indicatorColor: const Color(0x33D4AF37),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'خانه'),
            NavigationDestination(icon: Icon(Icons.swap_horiz), label: 'معامله'),
            NavigationDestination(icon: Icon(Icons.receipt_long_outlined), label: 'سفارش‌ها'),
            NavigationDestination(icon: Icon(Icons.person_outline), label: 'حساب من'),
          ],
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4AF37),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.diamond_outlined, color: Colors.black, size: 28),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('VIRA', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 2)),
                    Text('بازار امن طلا و ارز', style: TextStyle(color: Colors.white54)),
                  ],
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF29230F), Color(0xFF151515)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0x55D4AF37)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('خرید و فروش آسان', style: TextStyle(fontSize: 17, color: Colors.white70)),
                  SizedBox(height: 8),
                  Text('طلای خود را هوشمندانه معامله کن', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 18),
                  Text('قیمت‌ها در این نسخه آزمایشی هستند.', style: TextStyle(color: Color(0xFFD4AF37))),
                ],
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('قیمت بازار', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
        SliverList.builder(
          itemCount: market.length,
          itemBuilder: (context, i) => MarketCard(item: market[i]),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(child: ActionButton(label: 'خرید', icon: Icons.add_shopping_cart, onTap: () => _showTrade(context, true))),
                const SizedBox(width: 12),
                Expanded(child: ActionButton(label: 'فروش', icon: Icons.sell_outlined, onTap: () => _showTrade(context, false))),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static void _showTrade(BuildContext context, bool buy) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => TradeFormPage(buy: buy)));
  }
}

class MarketCard extends StatelessWidget {
  final MarketItem item;
  const MarketCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0x22D4AF37),
            child: Icon(item.icon, color: const Color(0xFFD4AF37)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(item.subtitle, style: const TextStyle(color: Colors.white54)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(item.price, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              Text(item.unit, style: const TextStyle(color: Colors.white54, fontSize: 12)),
            ],
          ),
          const SizedBox(width: 10),
          Icon(item.up ? Icons.trending_up : Icons.trending_down,
              color: item.up ? Colors.greenAccent : Colors.redAccent),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const ActionButton({super.key, required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Padding(padding: const EdgeInsets.symmetric(vertical: 14), child: Text(label)),
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFFD4AF37),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

class TradeTab extends StatelessWidget {
  const TradeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.swap_horizontal_circle_outlined, size: 80, color: Color(0xFFD4AF37)),
            const SizedBox(height: 18),
            const Text('ثبت معامله', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('نوع معامله را انتخاب کنید', style: TextStyle(color: Colors.white54)),
            const SizedBox(height: 24),
            ActionButton(label: 'خرید', icon: Icons.add_shopping_cart,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TradeFormPage(buy: true)))),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TradeFormPage(buy: false))),
              icon: const Icon(Icons.sell_outlined),
              label: const Padding(padding: EdgeInsets.symmetric(vertical: 14), child: Text('فروش')),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFD4AF37),
                side: const BorderSide(color: Color(0xFFD4AF37)),
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TradeFormPage extends StatefulWidget {
  final bool buy;
  const TradeFormPage({super.key, required this.buy});

  @override
  State<TradeFormPage> createState() => _TradeFormPageState();
}

class _TradeFormPageState extends State<TradeFormPage> {
  String asset = 'طلای ۱۸ عیار';
  final amount = TextEditingController();
  final weight = TextEditingController();

  @override
  void dispose() {
    amount.dispose();
    weight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.buy ? 'خرید' : 'فروش'), backgroundColor: Colors.transparent),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(widget.buy ? 'ثبت سفارش خرید' : 'ثبت درخواست فروش',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            DropdownButtonFormField<String>(
              value: asset,
              decoration: const InputDecoration(labelText: 'دارایی', border: OutlineInputBorder()),
              items: const [
                DropdownMenuItem(value: 'طلای ۱۸ عیار', child: Text('طلای ۱۸ عیار')),
                DropdownMenuItem(value: 'سکه امامی', child: Text('سکه امامی')),
                DropdownMenuItem(value: 'دلار', child: Text('دلار')),
              ],
              onChanged: (v) => setState(() => asset = v!),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: weight,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'مقدار / وزن', suffixText: 'واحد', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: amount,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'مبلغ تقریبی', suffixText: 'تومان', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('سفارش آزمایشی با موفقیت ثبت شد.')),
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFD4AF37),
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 54),
              ),
              child: Text(widget.buy ? 'ثبت سفارش خرید' : 'ثبت درخواست فروش'),
            ),
          ],
        ),
      ),
    );
  }
}

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text('سفارش‌های من', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        _order('خرید طلای ۱۸ عیار', '۰.۵ گرم', 'در انتظار پرداخت'),
        _order('فروش دلار', '۱۰۰ دلار', 'در حال بررسی'),
        _order('خرید سکه امامی', '۱ قطعه', 'تکمیل شده'),
      ],
    );
  }

  Widget _order(String title, String amount, String status) {
    return Card(
      color: const Color(0xFF151515),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0x22D4AF37),
          child: Icon(Icons.receipt_long, color: Color(0xFFD4AF37)),
        ),
        title: Text(title),
        subtitle: Text(amount),
        trailing: Text(status, style: const TextStyle(color: Color(0xFFD4AF37), fontSize: 12)),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text('حساب کاربری', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF151515),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              CircleAvatar(radius: 30, child: Icon(Icons.person)),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('کاربر VIRA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('احراز هویت نشده', style: TextStyle(color: Colors.white54)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _item(Icons.verified_user_outlined, 'احراز هویت'),
        _item(Icons.account_balance_wallet_outlined, 'کیف پول'),
        _item(Icons.security_outlined, 'امنیت حساب'),
        _item(Icons.support_agent, 'پشتیبانی'),
      ],
    );
  }

  Widget _item(IconData icon, String title) {
    return Card(
      color: const Color(0xFF151515),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFD4AF37)),
        title: Text(title),
        trailing: const Icon(Icons.chevron_left),
        onTap: () {},
      ),
    );
  }
}
