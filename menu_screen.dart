import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  late TabController _categoryTabController;
  late TabController _weeklyTabController;
  final List<String> _categories = ['full', 'special', 'weekly'];
  final List<String> _weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  void initState() {
    super.initState();
    _categoryTabController = TabController(
      length: _categories.length,
      vsync: this,
    );
    _weeklyTabController = TabController(length: _weekDays.length, vsync: this);
    _initializeMenuItems();
  }

  @override
  void dispose() {
    _categoryTabController.dispose();
    _weeklyTabController.dispose();
    super.dispose();
  }

  void _initializeMenuItems() {
    final fullMenuItems = [
      {
        'title': 'Margherita Pizza',
        'description':
            'Classic pizza with fresh tomatoes, mozzarella, and basil.',
        'price': 12.99,
        'category': 'full',
        'image':
            'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=1350&q=80',
      },
      {
        'title': 'Grilled Chicken Salad',
        'description': 'Fresh greens with grilled chicken and avocado.',
        'price': 9.99,
        'category': 'full',
        'image':
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1350&q=80',
      },
      {
        'title': 'Spaghetti Carbonara',
        'description': 'Creamy pasta with pancetta and Parmesan.',
        'price': 14.99,
        'category': 'full',
        'image':
            'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?auto=format&fit=crop&w=1350&q=80',
      },
      {
        'title': 'Truffle Risotto',
        'description': 'Creamy risotto with black truffle and Parmesan.',
        'price': 18.99,
        'category': 'special',
        'image':
            'https://images.unsplash.com/photo-1606491956689-2ea866880c84?auto=format&fit=crop&w=1350&q=80',
      },
      {
        'title': 'Seafood Platter',
        'description': 'Fresh selection of shrimp, scallops, and mussels.',
        'price': 24.99,
        'category': 'special',
        'image':
            'https://images.unsplash.com/photo-1617196034796-73dfa7b1fd56?auto=format&fit=crop&w=1350&q=80',
      },
    ];

    final weeklyMenuItems = [
      {
        'title': 'Fish Tacos',
        'description': 'Crispy fish tacos with pico de gallo and lime crema.',
        'price': 13.99,
        'category': 'weekly',
        'day': 'monday',
        'image':
            'https://images.unsplash.com/photo-1600585154516-50b62ae17a7e?auto=format&fit=crop&w=1350&q=80',
      },
      {
        'title': 'Chicken Alfredo',
        'description': 'Creamy Alfredo with grilled chicken and fresh herbs.',
        'price': 14.49,
        'category': 'weekly',
        'day': 'tuesday',
        'image':
            'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?auto=format&fit=crop&w=1350&q=80',
      },
      {
        'title': 'BBQ Ribs',
        'description': 'Slow-cooked ribs with house-made BBQ sauce.',
        'price': 16.99,
        'category': 'weekly',
        'day': 'wednesday',
        'image':
            'https://images.unsplash.com/photo-1563379929997-1e90f9a4bf0c?auto=format&fit=crop&w=1350&q=80',
      },
      {
        'title': 'Veggie Curry',
        'description': 'Spiced vegetable curry with coconut milk and rice.',
        'price': 11.49,
        'category': 'weekly',
        'day': 'thursday',
        'image':
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1350&q=80',
      },
      {
        'title': 'Seafood Paella',
        'description': 'Saffron-infused paella with shrimp and mussels.',
        'price': 17.99,
        'category': 'weekly',
        'day': 'friday',
        'image':
            'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?auto=format&fit=crop&w=1350&q=80',
      },
      {
        'title': 'Lamb Shank',
        'description': 'Slow-cooked lamb with rosemary and garlic mash.',
        'price': 19.99,
        'category': 'weekly',
        'day': 'saturday',
        'image':
            'https://images.unsplash.com/photo-1563379929997-1e90f9a4bf0c?auto=format&fit=crop&w=1350&q=80',
        'is_special':
            true, // Highlighted as today's special (Saturday, June 28, 2025)
      },
      {
        'title': 'Brunch Pancakes',
        'description': 'Fluffy pancakes with fresh berries and maple syrup.',
        'price': 8.99,
        'category': 'weekly',
        'day': 'sunday',
        'image':
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1350&q=80',
      },
    ];

    FirebaseFirestore.instance
        .collection('menu_items')
        .get()
        .then((snapshot) {
          if (snapshot.docs.isEmpty) {
            for (var item in fullMenuItems) {
              FirebaseFirestore.instance.collection('menu_items').add(item);
            }
            for (var item in weeklyMenuItems) {
              FirebaseFirestore.instance.collection('menu_items').add(item);
            }
          }
        })
        .catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Error initializing menu: $error",
                style: GoogleFonts.openSans(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.4;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          // Hero Section
          SliverAppBar(
            expandedHeight: imageHeight,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1350&q=80',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 24,
                    right: 24,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 800),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Our Menu",
                            style: GoogleFonts.playfairDisplay(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Explore our culinary creations",
                            style: GoogleFonts.openSans(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Tab Bar Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInLeft(
                    child: Text(
                      "OUR OFFERINGS",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFE91E63),
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 200),
                    child: Text(
                      "Culinary Delights",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: TabBar(
                      controller: _categoryTabController,
                      labelColor: const Color(0xFFE91E63),
                      unselectedLabelColor: Colors.black54,
                      indicatorColor: const Color(0xFFE91E63),
                      indicatorWeight: 3.0,
                      padding: const EdgeInsets.all(4),
                      labelStyle: GoogleFonts.openSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                      unselectedLabelStyle: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      tabs: const [
                        Tab(text: 'Full Menu'),
                        Tab(text: 'Specialties'),
                        Tab(text: 'Weekly'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Tab Content
          SliverFillRemaining(
            child: TabBarView(
              controller: _categoryTabController,
              children: [
                _buildMenuList('full'),
                _buildMenuList('special'),
                _buildWeeklyMenu(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList(String category) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('menu_items')
          .where('category', isEqualTo: category)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error loading menu items.",
              style: GoogleFonts.openSans(fontSize: 16, color: Colors.black54),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFFE91E63)),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              "No items available in this category.",
              style: GoogleFonts.openSans(fontSize: 16, color: Colors.black54),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final doc = snapshot.data!.docs[index];
            final data = doc.data() as Map<String, dynamic>;
            return FadeInUp(
              delay: Duration(milliseconds: 100 * index),
              child: _buildMenuCard(data),
            );
          },
        );
      },
    );
  }

  Widget _buildWeeklyMenu() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: TabBar(
            controller: _weeklyTabController,
            isScrollable: true,
            labelColor: const Color(0xFFE91E63),
            unselectedLabelColor: Colors.black54,
            indicatorColor: const Color(0xFFE91E63),
            indicatorWeight: 3.0,
            padding: const EdgeInsets.all(4),
            labelStyle: GoogleFonts.openSans(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
            unselectedLabelStyle: GoogleFonts.openSans(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            tabs: _weekDays.map((day) => Tab(text: day)).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _weeklyTabController,
            children: _weekDays.map((day) => _buildWeeklyList(day)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildWeeklyList(String day) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('menu_items')
          .where('category', isEqualTo: 'weekly')
          .where('day', isEqualTo: day.toLowerCase())
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error loading weekly menu.",
              style: GoogleFonts.openSans(fontSize: 16, color: Colors.black54),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFFE91E63)),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "No specials for $day yet. Check back soon!",
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          );
        }

        // Highlight today's special (Saturday, June 28, 2025, 05:04 PM PKT)
        final now = DateTime.now().toUtc().add(
          const Duration(hours: 5),
        ); // PKT is UTC+5
        final isToday =
            DateFormat('EEEE').format(now).toLowerCase() == day.toLowerCase();

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final data =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;
            if (isToday) {
              data['is_special'] = true;
            }
            return FadeInUp(
              delay: Duration(milliseconds: 100 * index),
              child: _buildMenuCard(data),
            );
          },
        );
      },
    );
  }

  Widget _buildMenuCard(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Stack(
              children: [
                Image.network(
                  data['image'] ?? 'https://via.placeholder.com/300',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 200,
                      color: Colors.grey[100],
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFE91E63),
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[100],
                    child: const Icon(
                      Icons.fastfood,
                      color: Color(0xFFE91E63),
                      size: 70,
                    ),
                  ),
                ),
                if (data.containsKey('is_special') && data['is_special'])
                  Positioned(
                    top: 16,
                    right: 16,
                    child: ZoomIn(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE91E63).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Today's Special",
                          style: GoogleFonts.openSans(
                            color: const Color(0xFFE91E63),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        data['title'] ?? 'Unknown Dish',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      'Rs. ${data['price'].toStringAsFixed(2)}',
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFE91E63),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  data['description'] ?? 'No description available.',
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "${data['title']} added to cart!",
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          backgroundColor: const Color(0xFFE91E63),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE91E63),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Add to Cart',
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
