import 'package:flutter/material.dart';
import 'package:urbanbuy/screens/orderpages/orderDetail.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          'Order History',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  OrderCard(
                    orderId: '#OQUSJEWK',
                    orderDate: 'November 2, 2024 at 09:41 PM',
                    price: '₹ 298.00',
                    status: 'Fulfilled',
                    statusColor: Colors.green,
                    icon: Icons.check_circle_outline,
                  ),
                  OrderCard(
                    orderId: '#OQUSJEWK',
                    orderDate: 'November 2, 2024 at 09:41 PM',
                    price: '₹ 298.00',
                    status: 'Cancelled',
                    statusColor: Colors.red,
                    icon: Icons.error_outline,
                  ),
                  OrderCard(
                    orderId: '#OQUSJEWK',
                    orderDate: 'November 2, 2024 at 09:41 PM',
                    price: '₹ 298.00',
                    status: 'Pending',
                    statusColor: Colors.yellow,
                    icon: Icons.warning_amber_outlined,
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

class OrderCard extends StatelessWidget {
  final String orderId;
  final String orderDate;
  final String price;
  final String status;
  final Color statusColor;
  final IconData icon;

  OrderCard({
    required this.orderId,
    required this.orderDate,
    required this.price,
    required this.status,
    required this.statusColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 234, 232, 232),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: statusColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Order id - $orderId',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const Icon(Icons.more_vert, color: Colors.black),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Order on - $orderDate',
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Price (12 items)',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  price,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Status',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  status,
                  style: TextStyle(color: statusColor),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderDetailsPage()),
                    );
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text(
                    'See Details',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text('Re-order',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
