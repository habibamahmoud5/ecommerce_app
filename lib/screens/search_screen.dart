import 'package:flutter/material.dart';
import '../widgets/order_nav_bar.dart';

/// Simple product model used for the search results list.
class Product {
  final String name;
  final double price;
  final int? discountPercent; // e.g. 52 for "-52%"
  final Color imageColor; // placeholder swatch until real assets are wired in

  const Product({
    required this.name,
    required this.price,
    required this.imageColor,
    this.discountPercent,
  });
}


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<String> _recentSearches = [
    'Jeans',
    'Casual clothes',
    'Hoodie',
    'Nike shoes black',
    'V-neck tshirt',
    'Winter clothes',
  ];

  // Mock catalog — swap for your real data source / API.
  final List<Product> _catalog = const [
    Product(
      name: 'Regular Fit Slogan',
      price: 1190,
      imageColor: Color(0xFF2B2E3A),
    ),
    Product(
      name: 'Regular Fit Polo',
      price: 1100,
      discountPercent: 52,
      imageColor: Color(0xFF2F8F7E),
    ),
    Product(
      name: 'Regular Fit Black',
      price: 1690,
      imageColor: Color(0xFF16181D),
    ),
    Product(
      name: 'Regular Fit V-Neck',
      price: 1290,
      imageColor: Color(0xFF1B1D22),
    ),
  ];

  List<Product> get _results {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return const [];
    return _catalog
        .where((p) => p.name.toLowerCase().contains(query))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() => setState(() {}));
    // Auto-focus the field & open the keyboard, matching the design.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _removeRecentSearch(String term) {
    setState(() => _recentSearches.remove(term));
  }

  void _clearAll() {
    setState(() => _recentSearches = []);
  }

  void _selectRecentSearch(String term) {
    _searchController.text = term;
    _searchController.selection =
        TextSelection.collapsed(offset: term.length);
    setState(() {});
  }

  void _onNavTap(int index) {
    if (index == 1) return; // already on Search
    Navigator.of(context).pop(); // go back, then let caller handle the tab
    // If you use a persistent shell/IndexedStack for the main tabs instead,
    // replace the two lines above with your own tab-switch call.
  }

  @override
  Widget build(BuildContext context) {
    final showResults = _searchController.text.trim().isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchField(),
            const SizedBox(height: 12),
            Expanded(
              child: showResults ? _buildResultsList() : _buildRecentList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: OrdersBottomNav(
        selectedIndex: 1,
        onItemSelected: _onNavTap,
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F7),
          borderRadius: BorderRadius.circular(14),
        ),
        child: TextField(
          controller: _searchController,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: 'Search for clothes...',
            hintStyle: const TextStyle(color: Colors.black45),
            prefixIcon: const Icon(Icons.search, color: Colors.black45),
            suffixIcon:
                const Icon(Icons.mic_none_outlined, color: Colors.black45),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentList() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Searches',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            if (_recentSearches.isNotEmpty)
              GestureDetector(
                onTap: _clearAll,
                child: const Text(
                  'Clear all',
                  style: TextStyle(color: Colors.black45, fontSize: 14),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        if (_recentSearches.isEmpty) _buildEmptyRecent(),
        for (final term in _recentSearches)
          _buildRecentRow(term),
      ],
    );
  }

  Widget _buildRecentRow(String term) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _selectRecentSearch(term),
            child: Text(term, style: const TextStyle(fontSize: 15)),
          ),
          GestureDetector(
            onTap: () => _removeRecentSearch(term),
            child: const Icon(Icons.cancel, color: Colors.black26, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyRecent() {
    return const Padding(
      padding: EdgeInsets.only(top: 40),
      child: Center(
        child: Text(
          'No recent searches',
          style: TextStyle(color: Colors.black38),
        ),
      ),
    );
  }

  Widget _buildResultsList() {
    final results = _results;

    if (results.isEmpty) {
      return const Center(
        child: Text(
          'No results found',
          style: TextStyle(color: Colors.black38, fontSize: 15),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: results.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) => _buildProductRow(results[index]),
    );
  }

  Widget _buildProductRow(Product product) {
    return Row(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: product.imageColor,
            borderRadius: BorderRadius.circular(12),
          ),
          // Swap this for: Image.asset(product.imagePath, fit: BoxFit.cover)
          child: const Icon(Icons.checkroom, color: Colors.white70, size: 24),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  if (product.discountPercent != null) ...[
                    const SizedBox(width: 8),
                    Text(
                      '-${product.discountPercent}%',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        const Icon(Icons.north_east, size: 18, color: Colors.black45),
      ],
    );
  }
}