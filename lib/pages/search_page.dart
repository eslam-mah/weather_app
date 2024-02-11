import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/custom_text_field.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, this.cityName});
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('search')),
      body: Center(
        child: CustomTextField(
          hint: '  city name',
          onSubmitted: (data) async {
            cityName = data;

            BlocProvider.of<WeatherCubit>(context)
                .getWeather(cityName: cityName!);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
