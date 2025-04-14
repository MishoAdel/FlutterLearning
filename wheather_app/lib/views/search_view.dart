import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xFFffffff),
        title: const Text("Search a city"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherProvider =
                  BlocProvider.of<GetWeatherCubit>(context);
              getWeatherProvider.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              labelText: "Search",
              hintText: "Enter city name",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
