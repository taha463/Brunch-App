import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          // Modern App Bar with Enhanced Navigation
          SliverAppBar(
            expandedHeight: 600,
            pinned: true,
            backgroundColor: const Color.fromARGB(0, 222, 1, 101),
            flexibleSpace: FlexibleSpaceBar(
              title: FadeIn(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  "Home",
                  style: GoogleFonts.playfairDisplay(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              titlePadding: const EdgeInsets.only(left: 24, bottom: 16),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1498654896293-37aacf113fd9',
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
                    bottom: 60,
                    left: 24,
                    right: 24,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 800),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Culinary Artistry",
                            style: GoogleFonts.playfairDisplay(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Exquisite flavors crafted with passion and precision",
                            style: GoogleFonts.openSans(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 24),
                          ZoomIn(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE91E63),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {},
                              child: Text(
                                "Reserve Now",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            collapsedHeight: 60,
            elevation: 4,
            shadowColor: Colors.black.withOpacity(0.2),
          ),

          // Blog Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInLeft(
                    child: Text(
                      "FROM OUR KITCHEN",
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
                      "Culinary Chronicles",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  FadeInUp(
                    child: Container(
                      height: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.network(
                                'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.85),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Summer Delights",
                                      style: GoogleFonts.playfairDisplay(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      "Explore our seasonal menu featuring vibrant, locally-sourced ingredients",
                                      style: GoogleFonts.openSans(
                                        color: Colors.white.withOpacity(0.9),
                                        fontSize: 16,
                                        height: 1.5,
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
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFFE91E63),
                      ),
                      label: Text(
                        "All Stories",
                        style: GoogleFonts.openSans(
                          color: const Color(0xFFE91E63),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Menu Section
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              child: Column(
                children: [
                  FadeInRight(
                    child: Text(
                      "SIGNATURE DISHES",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFE91E63),
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeInRight(
                    delay: const Duration(milliseconds: 200),
                    child: Text(
                      "Chef's Masterpieces",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FadeInRight(
                    delay: const Duration(milliseconds: 400),
                    child: Text(
                      "Curated with premium ingredients",
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.7,
                    children: List.generate(4, (index) {
                      return FadeInUp(
                        delay: Duration(milliseconds: 200 * index),
                        child: MenuCard(
                          key: Key('menu_$index'),
                          title: [
                            "Truffle Risotto",
                            "Seafood Symphony",
                            "Berry Pavlova",
                            "Herb Salmon",
                          ][index],
                          price: ["\$26", "\$42", "\$18", "\$32"][index],
                          imageUrl: [
                            'https://images.unsplash.com/photo-1606491956689-2ea866880c84',
                            'https://images.unsplash.com/photo-1617196034796-73dfa7b1fd56',
                            'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
                            'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2',
                          ][index],
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 40),
                  ZoomIn(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFE91E63),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        side: const BorderSide(
                          color: Color(0xFFE91E63),
                          width: 2,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Explore Menu",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Personalized Picks Section with Chatbot
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInLeft(
                    child: Text(
                      "PERSONALIZED PICKS",
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
                      "Curated For You",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 400),
                    child: Text(
                      "Dishes tailored to your taste",
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 320,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _recommendedDishes.length,
                      itemBuilder: (context, index) {
                        final dish = _recommendedDishes[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: FadeInUp(
                            delay: Duration(milliseconds: 200 * index),
                            child: SizedBox(
                              width: 200,
                              child: MenuCard(
                                key: Key('recommended_$index'),
                                title: dish['title']!,
                                price: dish['price']!,
                                imageUrl: dish['imageUrl']!,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  ZoomIn(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE91E63),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        _showDishChatbotDialog(context);
                      },
                      child: Text(
                        "Ask About Dishes",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Locations Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              child: Column(
                children: [
                  FadeInLeft(
                    child: Text(
                      "OUR LOCATIONS",
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
                      "Find Us",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FadeInUp(
                        child: LocationCard(
                          key: const Key('location_downtown'),
                          city: "Downtown",
                          address: "123 Main Street\nFloor 5",
                          hours: "8AM - 10PM",
                        ),
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        child: LocationCard(
                          key: const Key('location_riverside'),
                          city: "Riverside",
                          address: "456 River Road\nBy the Bridge",
                          hours: "9AM - 11PM",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Events Section
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              color: const Color(0xFFF1F3F5),
              child: Column(
                children: [
                  FadeInRight(
                    child: Text(
                      "EVENTS",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFE91E63),
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeInRight(
                    delay: const Duration(milliseconds: 200),
                    child: Text(
                      "Culinary Experiences",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  FadeInUp(
                    child: EventCard(
                      key: const Key('event_wine'),
                      date: "JUN 30",
                      title: "Wine Tasting",
                      description:
                          "Savor our curated selection of international wines",
                    ),
                  ),
                  const SizedBox(height: 24),
                  FadeInUp(
                    delay: const Duration(milliseconds: 200),
                    child: EventCard(
                      key: const Key('event_masterclass'),
                      date: "JUL 12",
                      title: "Chef's Masterclass",
                      description:
                          "Learn signature dishes from our master chefs",
                    ),
                  ),
                ],
              ),
            ),
          ),

          // About Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FadeIn(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: const NetworkImage(
                        'https://images.unsplash.com/photo-1600565193348-f74bd3c7ccdf',
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FadeIn(
                    delay: const Duration(milliseconds: 200),
                    child: Text(
                      "OUR STORY",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFE91E63),
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FadeIn(
                    delay: const Duration(milliseconds: 400),
                    child: Text(
                      "Crafting Memories Since 2005",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FadeIn(
                    delay: const Duration(milliseconds: 600),
                    child: Text(
                      "Born from a passion for authentic flavors and warm hospitality, our restaurant creates unforgettable dining experiences through innovative culinary arts.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  FadeIn(
                    delay: const Duration(milliseconds: 800),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Discover Our Journey",
                        style: GoogleFonts.openSans(
                          color: const Color(0xFFE91E63),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Contact Section
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              color: const Color(0xFFF1F3F5),
              child: Column(
                children: [
                  FadeInLeft(
                    child: Text(
                      "CONNECT WITH US",
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
                      "Get In Touch",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  FadeInUp(
                    child: ContactCard(
                      key: const Key('contact_visit'),
                      icon: Icons.location_on,
                      title: "Visit Us",
                      details: "123 Culinary Avenue\nFood District, FC 10001",
                    ),
                  ),
                  const SizedBox(height: 24),
                  FadeInUp(
                    delay: const Duration(milliseconds: 200),
                    child: ContactCard(
                      key: const Key('contact_call'),
                      icon: Icons.phone,
                      title: "Call Us",
                      details: "(123) 456-7890\n(123) 456-7891",
                    ),
                  ),
                  const SizedBox(height: 24),
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: ContactCard(
                      key: const Key('contact_email'),
                      icon: Icons.email,
                      title: "Email Us",
                      details:
                          "hello@culinaryexperience.com\nreservations@culinaryexperience.com",
                    ),
                  ),
                  const SizedBox(height: 40),
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Footer
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              color: const Color(0xFF1A1C1E),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIcon(
                        key: const Key('social_fb'),
                        icon: Icons.facebook,
                      ),
                      SocialIcon(
                        key: const Key('social_tk'),
                        icon: Icons.tiktok,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "© 2025 Culinary Experience. All Rights Reserved.",
                    style: GoogleFonts.openSans(
                      color: Colors.white70,
                      fontSize: 12,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Privacy Policy | Terms of Service",
                    style: GoogleFonts.openSans(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Simulated AI recommendation logic
  List<Map<String, String>> get _recommendedDishes {
    // Simulated user preferences (in a real app, this would come from user input or a backend)
    const userPreferences = {'dietary': 'vegetarian', 'taste': 'savory'};

    // Sample dish database
    final allDishes = [
      {
        'title': 'Truffle Risotto',
        'price': '\$26',
        'imageUrl':
            'https://images.unsplash.com/photo-1606491956689-2ea866880c84',
        'dietary': 'vegetarian',
        'taste': 'savory',
        'description':
            'Creamy risotto infused with earthy truffle oil and Parmesan.',
      },
      {
        'title': 'Seafood Symphony',
        'price': '\$42',
        'imageUrl':
            'https://images.unsplash.com/photo-1617196034796-73dfa7b1fd56',
        'dietary': 'non-vegetarian',
        'taste': 'savory',
        'description':
            'A medley of fresh shrimp, scallops, and mussels in a light tomato broth.',
      },
      {
        'title': 'Berry Pavlova',
        'price': '\$18',
        'imageUrl':
            'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
        'dietary': 'vegetarian',
        'taste': 'sweet',
        'description':
            'Crispy meringue topped with whipped cream and fresh berries.',
      },
      {
        'title': 'Herb Salmon',
        'price': '\$32',
        'imageUrl':
            'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2',
        'dietary': 'non-vegetarian',
        'taste': 'savory',
        'description':
            'Pan-seared salmon with a herb crust, served with lemon aioli.',
      },
      {
        'title': 'Veggie Quinoa Bowl',
        'price': '\$22',
        'imageUrl':
            'https://images.unsplash.com/photo-1512621776951-a57141f2eefd',
        'dietary': 'vegetarian',
        'taste': 'savory',
        'description':
            'Nutritious quinoa with roasted vegetables and tahini dressing.',
      },
    ];

    // Simple AI logic: filter dishes based on user preferences
    return allDishes.where((dish) {
      return dish['dietary'] == userPreferences['dietary'] &&
          dish['taste'] == userPreferences['taste'];
    }).toList();
  }

  // Chatbot dialog to display dish information
  void _showDishChatbotDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const DishChatbotDialog(),
    );
  }
}

// Dish Chatbot Dialog
class DishChatbotDialog extends StatefulWidget {
  const DishChatbotDialog({super.key});

  @override
  State<DishChatbotDialog> createState() => _DishChatbotDialogState();
}

class _DishChatbotDialogState extends State<DishChatbotDialog> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isTyping = false;

  // Mock AI responses based on keywords
  String _getAIResponse(String userMessage) {
    final message = userMessage.toLowerCase();

    if (message.contains('menu') || message.contains('dishes')) {
      return "Our signature dishes include Truffle Risotto, Seafood Symphony, Herb Salmon, and Berry Pavlova. What would you like to know about?";
    } else if (message.contains('truffle') || message.contains('risotto')) {
      return "Our Truffle Risotto is made with Arborio rice, white truffle oil, Parmesan cheese, and wild mushrooms. It's a creamy, vegetarian dish with earthy flavors. Perfect as a main course! Price: \$26.";
    } else if (message.contains('seafood') || message.contains('symphony')) {
      return "Seafood Symphony features fresh shrimp, scallops, and mussels in a light tomato broth with garlic and herbs. Served with crusty bread. A customer favorite! Price: \$42.";
    } else if (message.contains('salmon') || message.contains('herb')) {
      return "Herb Salmon is pan-seared Atlantic salmon with a crispy herb crust, served with lemon aioli and seasonal vegetables. Gluten-free option available. Price: \$32.";
    } else if (message.contains('berry') || message.contains('pavlova')) {
      return "Berry Pavlova is a crispy meringue base topped with whipped cream and fresh seasonal berries. A light and refreshing dessert! Price: \$18.";
    } else if (message.contains('vegetarian') || message.contains('vegan')) {
      return "Vegetarian options: Truffle Risotto, Veggie Quinoa Bowl, and Berry Pavlova (dessert). We also offer vegan modifications - just ask your server!";
    } else if (message.contains('recommend')) {
      return "Based on popular choices, I recommend:\n1. Truffle Risotto for vegetarians\n2. Herb Salmon for seafood lovers\n3. Berry Pavlova for dessert\nWhat type of dish are you looking for?";
    } else if (message.contains('ingredients') ||
        message.contains('allergen')) {
      return "We prioritize fresh, locally-sourced ingredients. For specific allergen information, please ask about a particular dish. Common allergens are marked on our menu.";
    } else if (message.contains('hello') || message.contains('hi')) {
      return "Hello! I'm your dish assistant. Ask me about our menu, ingredients, or recommendations!";
    } else {
      return "I'm here to help you with dish information! You can ask about:\n- Menu items\n- Ingredients\n- Dietary options\n- Recommendations\nTry asking: 'What's in the Truffle Risotto?'";
    }
  }

  void _sendMessage() {
    if (_messageController.text.isEmpty) return;

    final userMessage = _messageController.text;
    _messageController.clear();

    setState(() {
      _messages.add({'text': userMessage, 'isUser': true});
      _isTyping = true;
    });

    // Simulate AI thinking time
    Future.delayed(const Duration(milliseconds: 800), () {
      final aiResponse = _getAIResponse(userMessage);
      setState(() {
        _messages.add({'text': aiResponse, 'isUser': false});
        _isTyping = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 700),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFFE91E63).withOpacity(0.2),
                  child: const Icon(
                    Icons.restaurant_menu,
                    color: Color(0xFFE91E63),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "Dish Assistant",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const Divider(height: 30),

            // Chat messages
            Expanded(
              child: ListView.builder(
                reverse: false,
                itemCount: _messages.length + (_isTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == _messages.length && _isTyping) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Assistant is typing...",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(width: 8),
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ],
                      ),
                    );
                  }

                  final message = _messages[index];
                  return _MessageBubble(
                    text: message['text'],
                    isUser: message['isUser'],
                  );
                },
              ),
            ),

            // Input area
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "Ask about our dishes...",
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.openSans(color: Colors.grey),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFFE91E63)),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const _MessageBubble({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!isUser)
            const CircleAvatar(
              backgroundColor: Color(0xFFE91E63),
              child: Icon(Icons.restaurant, color: Colors.white, size: 18),
            ),
          Container(
            constraints: const BoxConstraints(maxWidth: 280),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isUser ? const Color(0xFFE91E63) : Colors.grey[100],
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
                bottomLeft: isUser ? const Radius.circular(18) : Radius.zero,
                bottomRight: isUser ? Radius.zero : const Radius.circular(18),
              ),
            ),
            child: Text(
              text,
              style: GoogleFonts.openSans(
                fontSize: 15,
                color: isUser ? Colors.white : Colors.black87,
                height: 1.4,
              ),
            ),
          ),
          if (isUser)
            const CircleAvatar(
              backgroundColor: Color(0xFF1A1C1E),
              child: Icon(Icons.person, color: Colors.white, size: 18),
            ),
        ],
      ),
    );
  }
}

// Menu Card Component
class MenuCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const MenuCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFE91E63),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Location Card Component
class LocationCard extends StatelessWidget {
  final String city;
  final String address;
  final String hours;

  const LocationCard({
    super.key,
    required this.city,
    required this.address,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(24),
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
        children: [
          const Icon(Icons.location_on, size: 40, color: Color(0xFFE91E63)),
          const SizedBox(height: 16),
          Text(
            city,
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            address,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(color: Colors.black54, height: 1.5),
          ),
          const SizedBox(height: 12),
          Text(
            hours,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600,
              color: const Color(0xFFE91E63),
            ),
          ),
        ],
      ),
    );
  }
}

// Event Card Component
class EventCard extends StatelessWidget {
  final String date;
  final String title;
  final String description;

  const EventCard({
    super.key,
    required this.date,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              date,
              style: GoogleFonts.openSans(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: const Color(0xFFE91E63),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.openSans(
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Join Now",
                    style: GoogleFonts.openSans(
                      color: const Color(0xFFE91E63),
                      fontWeight: FontWeight.w600,
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

// Contact Card Component
class ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String details;

  const ContactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        children: [
          Icon(icon, size: 32, color: const Color(0xFFE91E63)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  details,
                  style: GoogleFonts.openSans(
                    color: Colors.black54,
                    height: 1.5,
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

// Social Media Icon Component
class SocialIcon extends StatelessWidget {
  final IconData icon;

  const SocialIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white70, size: 24),
    );
  }
}
