import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main(){
  runApp(const MyApp()); 
}

class Plan {
  String name; 
  String description; 
  DateTime date; 
  bool isCompleted; 

  Plan({
    requried this.name,
    requried this.description,
    requried this.date, 
    this.isCompleted = false; 
  });
}

class MyApp extends Stateless Widget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Travel Plan App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true, 
      ),
      home const PlanManagerScreen(), 
    );
  }
}

class PlanManagerScreen extends StatefulWidget{
  const PlanManagerScreen({super.key});
  
  @override
  PlanManagerState createState() => PlanManagerState(); 
}

class planManaPlanManagerStategerState extends State<PlanManagerScreen>{
  List<Plan> plans = [];

  late CalendarFormat calendarFormat;
  late DateTime highlightDay;
  late DateTime selectedDate; 

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now(); // Initialize with today's date
    calendarFormat = CalendarFormat.month; // Default format for calendar
  }

  void save() { 
    if(controllerName.text.isNotEmpty && controllerDescription.text.isNotEmpty && selectedDate != null) {
      Plan newPlan = Plan(
        name: controllerName.text,
        description: controllerDescription,
        date: selectedDate!, 
      );
      widget.onCreate(newPlan); 
      Navigator.of(context).pop(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controllerName, 
            decoration: const InputDecoration(labelText: 'Plan Name'),
          ),
          TextField(
            controller: controllerDescription, 
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          Row(
            children: [
              
            ]
          )
        ]
      )
    )
  }
}