import 'package:flutter/material.dart';
import '../design_constants.dart';

class EcommerceScreen extends StatefulWidget {
  const EcommerceScreen({super.key});

  @override
  State<EcommerceScreen> createState() => _EcommerceScreenState();
}

class _EcommerceScreenState extends State<EcommerceScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  final List<Map<String, dynamic>> products = [
    {'name': 'Title', 'price': '\$10.99', 'image': 'assets/product1.jpg'},
    {'name': 'Title', 'price': '\$8.99', 'image': 'assets/product2.jpg'},
    {'name': 'Title', 'price': '\$12.99', 'image': 'assets/product3.jpg'},
    {'name': 'Title', 'price': '\$15.99', 'image': 'assets/product4.jpg'},
    {'name': 'Title', 'price': '\$9.99', 'image': 'assets/product5.jpg'},
    {'name': 'Title', 'price': '\$14.99', 'image': 'assets/product6.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ecommerce'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            _buildNavigationTabs(),
            _buildBanner(),
            _buildProductGrid(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _navigateToScreen(context, 'booking'),
                    child: const Text('Booking'),
                  ),
                  ElevatedButton(
                    onPressed: () => _navigateToScreen(context, 'social_feed'),
                    child: const Text('Social Feed'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Ecommerce',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(FigmaBorderRadius.medium),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: FigmaColors.lightGray,
        ),
      ),
    );
  }

  Widget _buildNavigationTabs() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem(Icons.favorite_outline, 'Favorites'),
          _buildTabItem(Icons.history, 'History'),
          _buildTabItem(Icons.people_outline, 'Following'),
          _buildTabItem(Icons.menu, 'Menu'),
        ],
      ),
    );
  }

  Widget _buildTabItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 24),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [Colors.orange[300]!, Colors.yellow[200]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Banner title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('詳細を見る'),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Icon(Icons.image, size: 40, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    return Column(
      children: [
        _buildSectionHeader('Title'),
        _buildProductRow(products.take(4).toList()),
        const SizedBox(height: 20),
        _buildSectionHeader('Title'),
        _buildProductRow(products.skip(2).take(4).toList()),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Widget _buildProductRow(List<Map<String, dynamic>> rowProducts) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: rowProducts.length,
        itemBuilder: (context, index) {
          final product = rowProducts[index];
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 12),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(FigmaBorderRadius.small),
              ),
              color: FigmaColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FigmaColors.lightGray,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(FigmaBorderRadius.small)),
                      ),
                      child: Icon(Icons.image, size: 40, color: FigmaColors.mediumGray),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Brand', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Text(product['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(product['price'], style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'booking':
        Navigator.pushNamed(context, '/booking');
        break;
      case 'social_feed':
        Navigator.pushNamed(context, '/social_feed');
        break;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
