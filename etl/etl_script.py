import os
import requests
import csv
import boto3
from datetime import datetime
from dotenv import load_dotenv

load_dotenv()  # only for local testing; remove in container or prod

# Environment variables
API_KEY = os.getenv("WEATHER_API_KEY")
CITY = os.getenv("CITY_NAME", "Mumbai")
S3_BUCKET = os.getenv("S3_BUCKET_NAME", "onfianace-bucket")  # 🔁 update this
S3_KEY = f"weather-data/{CITY.lower()}_{datetime.now().strftime('%Y-%m-%d_%H-%M-%S')}.csv"

# Extract
def get_weather(city):
    url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={API_KEY}&units=metric"
    res = requests.get(url)
    return res.json()

# Transform + Load
def write_to_s3(data):
    weather = {
        "city": data["name"],
        "temperature": data["main"]["temp"],
        "description": data["weather"][0]["description"],
        "humidity": data["main"]["humidity"],
        "wind_speed": data["wind"]["speed"],
        "timestamp": datetime.now().isoformat()
    }

    csv_file = "/tmp/weather.csv"
    with open(csv_file, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=weather.keys())
        writer.writeheader()
        writer.writerow(weather)

    s3 = boto3.client("s3")
    s3.upload_file(csv_file, S3_BUCKET, S3_KEY)
    print(f"Uploaded to S3: {S3_KEY}")

if __name__ == "__main__":
    data = get_weather(CITY)
    write_to_s3(data)
