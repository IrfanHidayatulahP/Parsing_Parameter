import 'package:flutter/material.dart';
import 'package:pertemuan4/presentation/detail_order_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController makananController = TextEditingController();
  final TextEditingController minumanController = TextEditingController();
  final TextEditingController jumlahMakananController = TextEditingController();
  final TextEditingController jumlahMinumanController = TextEditingController();
  int totalHarga = 0;

  void calculateTotalPrice() {
    int jumlahMakanan = int.tryParse(jumlahMakananController.text) ?? 0;
    int jumlahMinuman = int.tryParse(jumlahMinumanController.text) ?? 0;
    setState(() {
      totalHarga = (jumlahMakanan * 32000) + (jumlahMinuman * 5000);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Order Page')),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: makananController,
              decoration: const InputDecoration(labelText: 'Order Makanan'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter food order';
                }
                return null;
              },
            ),
            TextFormField(
              controller: minumanController,
              decoration: const InputDecoration(labelText: 'Order Minuman'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter drink order';
                }
                return null;
              },
            ),
            TextFormField(
              controller: jumlahMakananController,
              decoration: const InputDecoration(labelText: 'Jumlah Makanan'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter food quantity';
                }
                return null;
              },
            ),
            TextFormField(
              controller: jumlahMinumanController,
              decoration: const InputDecoration(labelText: 'Jumlah Minuman'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter drink quantity';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateTotalPrice();
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => DetailOrderPage(
                      jumlahMakanan: jumlahMakananController.text,
                      jumlahMinuman: jumlahMinumanController.text,
                      makanan: makananController.text,
                      minuman: minumanController.text,
                      totalHarga: totalHarga,
                    ),
                  ),
                );
              }, child: const Text('Order Now')
            ),
          ],
        ),
      ),
    );
  }
}