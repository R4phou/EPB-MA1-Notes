import numpy as np


def get_questions(path):
    """
    The path is the path to a text file containing questions and answers.
    The file is formatted as follows:
        question1,answer1
        question2,answer2
        ...
    Returns a dictionary of questions. Each question is a dictionary with the following keys:
    question: the question
    answer: the answer
    """
    questions = {}
    with open(path, "r") as f:
        for line in f:
            q, a = line.strip().split(",")
            questions[q] = a
    return questions


def shuffle(questions):
    import random

    keys = list(questions.keys())
    random.shuffle(keys)
    return {key: questions[key] for key in keys}


def quiz(questions):
    """
    This function asks the user each question in the dictionary in a random order.
    It returns the number of questions the user got right.
    """
    points = 0
    i = 0
    errors = []
    VALID_ANSWERS = ["L1", "L2", "L3", "L4", "L5"]
    for q in np.random.choice(list(questions.keys()), len(questions), replace=False):
        i += 1
        a = str(input(str(i) + ". " + q + " belongs to which Layer? "))
        if a == "q":
            return
        while a not in VALID_ANSWERS:
            print("Invalid answer. Please enter L1, L2, L3, L4, or L5.")
            a = str(input(str(i) + ". " + q + " belongs to which Layer? "))
        if a == questions[q]:
            print("Correct!")
            points += 1
        else:
            err = [q, a, questions[q]]
            errors.append(err)
            print("Incorrect! The answer is " + questions[q] + ".")
    print("You got " + str(points) + "/" + str(len(questions)) + " correct.")

    print("The following questions were answered incorrectly:")
    for err in errors:
        print(err[0] + " belongs to " + err[2] + ", not " + err[1] + ".")


def get_random_questions(questions, n):
    """
    This function returns n random questions.
    """
    return np.random.choice(list(questions.keys()), n, replace=False)


if __name__ == "__main__":
    questions = get_questions("./quiz.txt")
    quiz(questions)
    # q = get_random_questions(questions, 10)
    # for i in q:
    #     print(i)
