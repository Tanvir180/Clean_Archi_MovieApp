import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importing for date formatting


class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  String? password;
  DateTime? selectedDate;
  String? selectedDropdownValue;
  String? radioValue;

  List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here you can handle the form submission
      print('Name: $name');
      print('Password: $password');
      print('Selected Date: ${selectedDate?.toLocal()}');
      print('Dropdown Value: $selectedDropdownValue');
      print('Radio Value: $radioValue');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Form Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(child: SizedBox( height: 200, width: 300, child: Image.asset('assets/splashScreen.png'))),

                // Name Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value;
                  },
                ),
                SizedBox(height: 16),

                // Password Field
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value;
                  },
                ),
                SizedBox(height: 16),

                // Date Picker
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        selectedDate == null
                            ? 'No date chosen!'
                            : 'Selected date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}',
                      ),
                    ),
                    TextButton(
                      onPressed: () => _selectDate(context),
                      child: Icon(Icons.date_range_sharp),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Dropdown Menu
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select an option',
                    border: OutlineInputBorder(),
                  ),
                  items: dropdownItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDropdownValue = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Radio Buttons
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text("Option A", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        leading: Radio<String>(
                          value: "A",
                          groupValue: radioValue,
                          onChanged: (String? value) {
                            setState(() {
                              radioValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text("Option B", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        leading: Radio<String>(
                          value: "B",
                          groupValue: radioValue,
                          onChanged: (String? value) {
                            setState(() {
                              radioValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
