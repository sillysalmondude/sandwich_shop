import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sandwich Shop App',
      home: OrderScreen(maxQuantity: 5),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;
  String _sandwichType = 'Footlong';

  void _increaseQuantity() {
    setState(() => _quantity++);
  }

  void _decreaseQuantity() {
    setState(() => _quantity--);
  }

  void _toggleSandwichType() {
    setState(() {
      _sandwichType = _sandwichType == 'Footlong' ? 'Six-inch' : 'Footlong';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandwich Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              quantity: _quantity,
              itemType: _sandwichType,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleSandwichType,
              child: Text(
                  'Switch to ${_sandwichType == 'Footlong' ? 'Six-inch' : 'Footlong'}'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledElevatedButton(
                  onPressed:
                      _quantity < widget.maxQuantity ? _increaseQuantity : null,
                  isEnabled: _quantity < widget.maxQuantity,
                  label: 'Add',
                ),
                StyledElevatedButton(
                  onPressed: _quantity > 0 ? _decreaseQuantity : null,
                  isEnabled: _quantity > 0,
                  label: 'Remove',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final int quantity;
  final String itemType;

  const OrderItemDisplay(
      {super.key, required this.quantity, required this.itemType});

  @override
  Widget build(BuildContext context) {
    return Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}');
  }
}

class StyledElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isEnabled;
  final String label;

  const StyledElevatedButton({
    super.key,
    required this.onPressed,
    required this.isEnabled,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? Colors.blueAccent : Colors.grey,
        foregroundColor: Colors.white,
      ),
      child: Text(label),
    );
  }
}
