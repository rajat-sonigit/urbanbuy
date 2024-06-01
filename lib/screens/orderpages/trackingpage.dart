import 'package:flutter/material.dart';

class OrderTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title:
            const Text('Order Details', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  DeliverySection(),
                  const SizedBox(height: 16),
                  OrderStatusCard(),
                  const SizedBox(height: 16),
                  OrderStatusCard(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            OrderPlacedButton(),
          ],
        ),
      ),
    );
  }
}

class DeliverySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_pin, color: Colors.black),
          const SizedBox(width: 8),
          const Text('Home - 360004', style: TextStyle(color: Colors.black)),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: const Text('Change'),
          ),
        ],
      ),
    );
  }
}

class OrderStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderStatusItem(
            status: 'Order Placed',
            id: '#OQUSJEWK',
            date: '08 JAN, 09:30 AM',
          ),
          OrderStatusItem(
            status: 'Order Dispached',
            id: '#OQUSJEWK',
            date: '09 JAN, 09:30 AM',
          ),
          OrderStatusItem(
            status: ' On Way ',
            id: '#OQUSJEWK',
            date: '08 JAN, 09:30 AM',
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'See more updates',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderStatusItem extends StatelessWidget {
  final String status;
  final String id;
  final String date;

  OrderStatusItem({required this.status, required this.id, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Icon(Icons.radio_button_checked, color: Colors.black),
              Container(
                height: 40, // Adjust this height based on the spacing you want
                width: 2,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(status, style: const TextStyle(color: Colors.black)),
              Text('id: $id • $date',
                  style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderPlacedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text('Order Placed'),
    );
  }
}
