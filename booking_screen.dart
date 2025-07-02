import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController guestsController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String selectedAmbiance = 'Indoor';

  final List<String> ambianceOptions = ['Indoor', 'Outdoor', 'Rooftop'];

  Future<void> _submitBooking() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('bookings').add({
          'name': nameController.text.trim(),
          'guests': int.parse(guestsController.text.trim()),
          'date': dateController.text.trim(),
          'time': timeController.text.trim(),
          'ambiance': selectedAmbiance,
          'email': FirebaseAuth.instance.currentUser?.email ?? 'guest',
          'createdAt': Timestamp.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Booking Confirmed!",
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

        _formKey.currentState?.reset();
        nameController.clear();
        guestsController.clear();
        dateController.clear();
        timeController.clear();
        setState(() => selectedAmbiance = 'Indoor');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Error submitting booking: $e",
              style: GoogleFonts.openSans(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime.now().add(const Duration(days: 365)),
      onConfirm: (date) {
        setState(() {
          dateController.text = DateFormat('dd MMMM yyyy').format(date);
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }

  void _showTimePicker() {
    DatePicker.showTimePicker(
      context,
      showTitleActions: true,
      onConfirm: (time) {
        setState(() {
          timeController.text = DateFormat('h:mm a').format(time);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          // Modern App Bar with Hero Image
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1528605248644-14dd04022da1?auto=format&fit=crop&w=1050&q=80',
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
                            "Reserve Your Table",
                            style: GoogleFonts.playfairDisplay(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Book your culinary experience with ease",
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

          // Form Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: FadeInUp(
                delay: const Duration(milliseconds: 400),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Book Your Experience",
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Secure your spot for an unforgettable dining experience",
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Name Field
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: "Full Name",
                              labelStyle: GoogleFonts.openSans(
                                color: Colors.black54,
                              ),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Color(0xFFE91E63),
                              ),
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.05),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: Color(0xFFE91E63),
                                  width: 2,
                                ),
                              ),
                            ),
                            style: GoogleFonts.openSans(),
                            validator: (val) =>
                                val!.isEmpty ? "Please enter your name" : null,
                          ),
                          const SizedBox(height: 20),

                          // Guests Field
                          TextFormField(
                            controller: guestsController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Number of Guests",
                              labelStyle: GoogleFonts.openSans(
                                color: Colors.black54,
                              ),
                              prefixIcon: const Icon(
                                Icons.group,
                                color: Color(0xFFE91E63),
                              ),
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.05),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: Color(0xFFE91E63),
                                  width: 2,
                                ),
                              ),
                            ),
                            style: GoogleFonts.openSans(),
                            validator: (val) => val!.isEmpty
                                ? "Please enter number of guests"
                                : null,
                          ),
                          const SizedBox(height: 20),

                          // Date Field
                          TextFormField(
                            controller: dateController,
                            readOnly: true,
                            onTap: _showDatePicker,
                            decoration: InputDecoration(
                              labelText: "Date",
                              labelStyle: GoogleFonts.openSans(
                                color: Colors.black54,
                              ),
                              prefixIcon: const Icon(
                                Icons.calendar_today,
                                color: Color(0xFFE91E63),
                              ),
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.05),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: Color(0xFFE91E63),
                                  width: 2,
                                ),
                              ),
                            ),
                            style: GoogleFonts.openSans(),
                            validator: (val) =>
                                val!.isEmpty ? "Please select a date" : null,
                          ),
                          const SizedBox(height: 20),

                          // Time Field
                          TextFormField(
                            controller: timeController,
                            readOnly: true,
                            onTap: _showTimePicker,
                            decoration: InputDecoration(
                              labelText: "Time",
                              labelStyle: GoogleFonts.openSans(
                                color: Colors.black54,
                              ),
                              prefixIcon: const Icon(
                                Icons.access_time,
                                color: Color(0xFFE91E63),
                              ),
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.05),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Ambiance Dropdown
                          DropdownButtonFormField<String>(
                            value: selectedAmbiance,
                            items: ambianceOptions.map((option) {
                              return DropdownMenuItem(
                                value: option,
                                child: Text(
                                  option,
                                  style: GoogleFonts.openSans(),
                                ),
                              );
                            }).toList(),
                            onChanged: (val) =>
                                setState(() => selectedAmbiance = val!),
                            decoration: InputDecoration(
                              labelText: "Seating Preference",
                              labelStyle: GoogleFonts.openSans(
                                color: Colors.black54,
                              ),
                              prefixIcon: const Icon(
                                Icons.room_preferences,
                                color: Color(0xFFE91E63),
                              ),
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.05),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: Color(0xFFE91E63),
                                  width: 2,
                                ),
                              ),
                            ),
                            style: GoogleFonts.openSans(),
                          ),
                          const SizedBox(height: 32),

                          // Submit Button
                          ZoomIn(
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE91E63),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                    horizontal: 32,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: _submitBooking,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.send, size: 20),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Confirm Reservation",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Footer Spacing
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    guestsController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }
}
