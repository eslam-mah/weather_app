import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/cubits/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, weatherState>(builder: (context, State) {
      if (State is weatherLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (State is weatherFailure) {
        return Center(
          child: Text('Something went wrong, try again'),
        );
      } else if (State is weatherSuccess) {
        WeatherModel? weather;
        weather = BlocProvider.of<WeatherCubit>(context).weatherModel;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('Weather'),
          ),
          backgroundColor: Colors.orange,
          body: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Text(
                weather!.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              Text(weather.time.toString(), style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/clear.png'),
                  Text(
                    weather.temp.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ],
              ),
              SizedBox(
                height: 90,
              ),
              Text(weather.weatherStateName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))
            ],
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text('Weather App'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(),
                        ));
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          body: Center(child: Text('there is no weather search now')),
        );
      }
    });
  }
}


//return Scaffold(
  //      appBar: AppBar(
    //      title: Text('Weather App'),
      //    actions: [
        //    IconButton(
          //      onPressed: () {
            //      Navigator.push(
              //        context,
                //      MaterialPageRoute(
                  //      builder: (context) => SearchPage(),
                    //  ));
                //},
               // icon: Icon(Icons.search))
          //],
        //),
        //body: Center(child: Text('there is no weather search now')),
      //);