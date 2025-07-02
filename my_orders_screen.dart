import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final String userEmail = FirebaseAuth.instance.currentUser?.email ?? 'guest';

  Future<void> _cancelOrder(String docId) async {
    await FirebaseFirestore.instance.collection('orders').doc(docId).delete();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Order cancelled')));
  }

  Future<void> _mockPay(List<DocumentSnapshot> unpaidOrders) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    for (var doc in unpaidOrders) {
      batch.update(doc.reference, {'paid': true});
    }

    await batch.commit();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Payment successful!')));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .where('userEmail', isEqualTo: userEmail)
          .orderBy('orderTime', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final orders = snapshot.data!.docs;

        final unpaidOrders = orders
            .where((doc) => !(doc['paid'] ?? false))
            .toList();

        double totalUnpaid = unpaidOrders.fold(0, (sum, doc) {
          final price = (doc['price'] ?? 0).toDouble();
          final qty = (doc['quantity'] ?? 1);
          return sum + (price * qty);
        });

        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "My Orders",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: orders.isEmpty
                  ? const Center(child: Text("No orders yet"))
                  : ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        final title = order['title'] ?? '';
                        final qty = order['quantity'] ?? 1;
                        final price = order['price'] ?? 0;
                        final notes = order['notes'] ?? '';
                        final paid = order['paid'] ?? false;

                        return ListTile(
                          leading: Icon(
                            paid ? Icons.check_circle : Icons.pending,
                            color: paid ? Colors.green : Colors.orange,
                          ),
                          title: Text('$title (x$qty)'),
                          subtitle: Text(
                            'Rs. ${price * qty}${notes.isNotEmpty ? '\nNote: $notes' : ''}',
                          ),
                          trailing: !paid
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => _cancelOrder(order.id),
                                )
                              : null,
                        );
                      },
                    ),
            ),
            if (unpaidOrders.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Total Due: Rs. ${totalUnpaid.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.payment),
                      label: const Text("Pay Now"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () => _mockPay(unpaidOrders),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
