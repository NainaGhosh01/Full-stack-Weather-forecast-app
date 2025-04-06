from flask import render_template, request # 
from app import app
from app.weather import get_weather

@app.route('/', methods=['GET', 'POST'])
def index():
    weather_data = None
    error = None

    if request.method == 'POST':
        city = request.form.get('city')
        if city:
            weather_data, error = get_weather(city)
        else:
            error = "Please enter a city name."

    return render_template('index.html', weather=weather_data, error=error)
