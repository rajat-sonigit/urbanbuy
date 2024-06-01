import 'package:flutter/material.dart';
import 'package:urbanbuy/screens/orderpages/trackingpage.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

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
        title: const Text('My Order', style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () {},
            child:
                const Text('Need Help?', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text('Order Details',
                style: TextStyle(color: Colors.black, fontSize: 22)),
            OrderDetailsSection(),
            SizedBox(height: 16),
            Text('Order Status',
                style: TextStyle(color: Colors.black, fontSize: 22)),
            OrderStatusSection(),
            SizedBox(height: 16),
            OrderItemsSection(),
          ],
        ),
      ),
    );
  }
}

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 238, 238),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderDetailRow(label: 'Order Created', value: 'Sun, May 7, 2021'),
          OrderDetailRow(label: 'Order time', value: '06 : 18 PM'),
          OrderDetailRow(label: 'Order id', value: '#OQUSJEWK'),
        ],
      ),
    );
  }
}

class OrderStatusSection extends StatelessWidget {
  const OrderStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 232, 232),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Current Status', style: TextStyle(color: Colors.black)),
              Spacer(),
              Text('Pending', style: TextStyle(color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderItemsSection extends StatelessWidget {
  const OrderItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Full - Filled (3)', style: TextStyle(color: Colors.black)),
        SizedBox(height: 16),
        OrderItemCard(),
        OrderItemCard(),
        OrderItemCard(),
      ],
    );
  }
}

class OrderDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const OrderDetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black)),
          Text(value, style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }
}

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 232, 232),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tracking id:', style: TextStyle(color: Colors.black)),
              Text('#1246', style: TextStyle(color: Colors.black87)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tracking number:', style: TextStyle(color: Colors.black)),
              Text('20349201039', style: TextStyle(color: Colors.black87)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tracking URL:',
                  style: TextStyle(color: Colors.black)),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderTrackingPage()),
                  );
                },
                child: const Text('Click Here',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Image.network(
                'https://i0.wp.com/royaldryfruits.in/wp-content/uploads/2018/07/melting-chocolate-bar-png-cadbury-dairy-milk-bar-375.png?ssl=1',
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cadbury Celebrations Pre',
                      style: TextStyle(color: Colors.black)),
                  Text('₹149.00', style: TextStyle(color: Colors.black87)),
                  Text('Sold by: Men groove',
                      style: TextStyle(color: Colors.black)),
                  Text('Qty: 1', style: TextStyle(color: Colors.black)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
