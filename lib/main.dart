import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Клиника',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Клиника'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentPage()),
                );
              },
              child: Text('Записаться к врачу'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorsPage()),
                );
              },
              child: Text('Врачи клиники'),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Запись к врачу'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Имя'),
            ),
            TextField(
              controller: surnameController,
              decoration: InputDecoration(labelText: 'Фамилия'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Номер телефона'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // по нажатию кнопки выводится уведомление
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Мы вам позвоним')),
                );
                // Очищается пооля ввода
                nameController.clear();
                surnameController.clear();
                phoneController.clear();
              },
              child: Text('Отправить'),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Здесь вы можете добавить список врачей
    final List<String> doctors = [
      'Стоматолог Елизарян Артур Артурович',
      'Терапевт Светова Мария Александровна',
      'Окушер Сидоров Константин Евгеньевич',
      'Хирург Зайцев Евгений Васильевич',
      'Окулист Зайцева Елизавета Васильевна',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Врачи клиники'),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(doctors[index]),
          );
        },
      ),
    );
  }
}
