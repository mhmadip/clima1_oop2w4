# clima1_oop2  ☁ Week4
We will finish the CityScreen to finalize the app by using push and pop methods with Navigator and TextField to get user input if they like to get the weather for
different cities through:

1- Adding a new Function to getCityWeatherData(String cityName) into WeatherModel class.
2- Adding TextField widget with some styling to get user input (city name) in the CityScreen.
3- Using Navigator.push in LocationScreen to receive cityName (user input) from CityScreen using
Navigator.pop(context, cityName) since pop method can return a value to other screens.
4- Update UI in the LocationScreen by adding setState into updateUI function and checking if there
is a cityName available(not null) from CityScreen to use it in updating the UI process.
