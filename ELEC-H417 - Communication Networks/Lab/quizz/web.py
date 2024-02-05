from flask import Flask, render_template, request, redirect, url_for, jsonify
import quiz as qz

app = Flask(__name__)


questions = qz.get_questions("./quiz.txt")

questions = qz.shuffle(questions)


@app.route("/")
def index():
    return render_template("./index.html")


@app.route("/get_question", methods=["GET"])
def get_question():
    return jsonify(questions)


if __name__ == "__main__":
    app.run(debug=True)
