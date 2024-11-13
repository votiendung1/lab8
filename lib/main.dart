import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  // Các biến cần thiết
  double height = 0.0;
  double weight = 0.0;
  double bmi = 0.0;
  String result = '';
  String interpretation = '';

  // Hàm tính BMI
  void calculateBMI() {
    setState(() {
      bmi = weight / (height * height);
      if (bmi < 18.5) {
        result = 'Underweight';
        interpretation = 'Bạn cần ăn uống đầy đủ hơn.';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        result = 'Normal weight';
        interpretation = 'Cơ thể khỏe mạnh!';
      } else if (bmi >= 25 && bmi < 29.9) {
        result = 'Overweight';
        interpretation = 'Cần duy trì chế độ ăn uống hợp lý.';
      } else {
        result = 'Obesity';
        interpretation = 'Cần có chế độ giảm cân hợp lý.';
      }
    });
  }

  // Hàm tạo giao diện
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Đoạn giao diện nhập cân nặng và chiều cao
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cân nặng (kg)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  weight = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 10.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Chiều cao (m)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  height = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Tính BMI'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            SizedBox(height: 20.0),
            // Kết quả và chỉ dẫn
            Text(
              'BMI: ${bmi.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            Text(
              result,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              interpretation,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
