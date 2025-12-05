from flask import Flask, jsonify
import os

app = Flask(__name__)



@app.route("/")
def home():
    return jsonify({
        "message": "backend",
        "db_user": os.getenv("DB_USER", "unknown"),
        "env_message": os.getenv("MESSAGE", "none")
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
