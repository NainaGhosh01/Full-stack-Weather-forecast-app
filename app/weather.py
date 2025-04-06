import requests # 
import os

def get_weather(city):
    import os
    api_key = os.getenv("WEATHER_API_KEY") or os.environ["WEATHER_API_KEY"]

    url = f"https://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric"
    
    try:
        response = requests.get(url)
        data = response.json()
        if data["cod"] != 200:
            return None, data.get("message", "City not found.")
        weather = {
    "city": data["name"],
    "temperature": data["main"]["temp"],
    "description": data["weather"][0]["description"],
    "humidity": data["main"]["humidity"],
    "wind_speed": data["wind"]["speed"],
    "icon": data["weather"][0]["icon"]
}

        return weather, None
    except Exception as e:
        return None, str(e)
