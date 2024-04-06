from flask import Flask, request, jsonify
from flask_cors import CORS
import nltk
nltk.download('punkt')
nltk.download('stopwords')
nltk.download('vader_lexicon')
import re
import heapq  
import pickle
import pandas as pd
import numpy as np
from string import punctuation
from nltk.corpus import stopwords
punctuation = punctuation + '\n'
from nltk.tokenize import word_tokenize, sent_tokenize
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
from sklearn.linear_model import LogisticRegression
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.svm import SVC
from sklearn.linear_model import RidgeClassifier
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from sklearn.feature_extraction.text import CountVectorizer

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "http://localhost:3000"}})

def nltk_summarizer(input_text, number_of_sentence):
    stopWords = set(stopwords.words("english"))
    word_frequencies = {}  
    for word in nltk.word_tokenize(input_text):  
        if word not in stopWords:
            if word not in punctuation:
                if word not in word_frequencies.keys():
                    word_frequencies[word] = 1
                else:
                    word_frequencies[word] += 1
    maximum_frequncy = max(word_frequencies.values())

    for word in word_frequencies.keys():  
        word_frequencies[word] = (word_frequencies[word]/maximum_frequncy)

    sentence_list = nltk.sent_tokenize(input_text)
    sentence_scores = {}  
    for sent in sentence_list:  
        for word in nltk.word_tokenize(sent.lower()):
            if word in word_frequencies.keys():
                if len(sent.split(' ')) < 30:
                    if sent not in sentence_scores.keys():
                        sentence_scores[sent] = word_frequencies[word]
                    else:
                        sentence_scores[sent] += word_frequencies[word]

    summary_sentences = heapq.nlargest(number_of_sentence, sentence_scores, key=sentence_scores.get)

    summary = ' '.join(summary_sentences)  
    return summary



en_data = pd.read_csv(r"dataset/dataset.csv")



def delete_links(input_text):
    pettern  = r'''(?i)\b((?:https?://|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))'''
    out_text = re.sub(pettern, ' ', input_text)
    return out_text



def delete_repeated_characters(input_text):
    pattern  = r'(.)\1{2,}'
    out_text = re.sub(pattern, r"\1\1", input_text)
    return out_text


def clean_text(input_text):
    replace = r'[/(){}\[\]|@âÂ,;\?\'\"\*…؟–’،!&\+-:؛-]'
    out_text = re.sub(replace, " ", input_text)
    words = nltk.word_tokenize(out_text)
    words = [word for word in words if word.isalpha()]
    out_text = ' '.join(words)
    return out_text





def delete_stopwords(input_text):
    stop_words = set(nltk.corpus.stopwords.words("english"))
    tokenizer = nltk.tokenize.WhitespaceTokenizer()
    tokens = tokenizer.tokenize(input_text)
    out_text = [w for w in tokens if not w in stop_words]
    out_text = ' '.join(out_text)
    return out_text





def text_prepare(input_text):
    out_text = delete_links(input_text)
    out_text = delete_repeated_characters(out_text)
    out_text = clean_text(out_text)
    out_text = delete_stopwords(out_text)
    out_text = out_text.lower()
    return out_text



en_data['Processed Text'] = en_data['Text'].apply(text_prepare)





en_label_encoder = LabelEncoder()
en_data['Category Encoded'] = en_label_encoder.fit_transform(en_data['Category'])





en_X_train, en_X_test, en_y_train, en_y_test = train_test_split(en_data['Processed Text'], en_data['Category Encoded'], test_size=0.2, random_state=0)





def tfidf_features(X_train, X_test, ngram_range):
    tfidf_vectorizer = TfidfVectorizer(min_df=2, max_df=0.5, ngram_range=(1, ngram_range))
    X_train = tfidf_vectorizer.fit_transform(X_train)
    X_test = tfidf_vectorizer.transform(X_test)
    return X_train, X_test





en_features_train, en_features_test = tfidf_features(en_X_train, en_X_test, 2)





def fit_model(model_name):
    if model_name == 'ridge_model':
        model_name = RidgeClassifier()
    elif model_name == 'random_forest_model':
        model_name = RandomForestClassifier()
    elif model_name == 'logistic_regression_model':
        model_name = LogisticRegression()
    elif model_name == 'kneighbors_model':
        model_name = KNeighborsClassifier()
    elif model_name == 'decision_tree_model':
        model_name = DecisionTreeClassifier()
    elif model_name == 'gaussian_nb_model':
        model_name = GaussianNB()
    model_name.fit(en_features_train.toarray(), en_y_train)
    model_predictions = model_name.predict(en_features_test.toarray())
    accuracy = accuracy_score(en_y_test, model_predictions)
    print(f"Accuracy on test for {model_name}: {accuracy}")
    return accuracy


en_ridge_model = fit_model('ridge_model')
pickle.dump(en_ridge_model, open('en_ridge_model.pkl','wb'))


en_random_forest_model = fit_model('random_forest_model')
pickle.dump(en_random_forest_model, open('en_random_forest_model.pkl','wb'))


en_logistic_regression_model = fit_model('logistic_regression_model')
pickle.dump(en_logistic_regression_model, open('en_logistic_regression_model.pkl','wb'))


en_kneighbors_model = fit_model('kneighbors_model')
pickle.dump(en_kneighbors_model, open('en_kneighbors_model.pkl','wb'))


en_decision_tree_model = fit_model('decision_tree_model')
pickle.dump(en_decision_tree_model, open('en_decision_tree_model.pkl','wb'))


en_gaussian_nb_model = fit_model('gaussian_nb_model')
pickle.dump(en_gaussian_nb_model, open('en_gaussian_nb_model.pkl','wb'))


def analyze_sentiment(text):
    sid = SentimentIntensityAnalyzer()
    sentiment_scores = sid.polarity_scores(text)
    compound_score = sentiment_scores['compound']
    sentiment_score = (compound_score + 1) * 5 
    return round(sentiment_score)  


en_data['Processed Text'] = en_data['Text'].apply(text_prepare)

en_X_train, en_X_test = train_test_split(en_data['Processed Text'], test_size=0.2, random_state=0)

vectorizer = CountVectorizer()
en_features_train = vectorizer.fit_transform(en_X_train)
en_features_test = vectorizer.transform(en_X_test)

random_forest_model = RandomForestClassifier()
random_forest_model.fit(en_features_train, en_y_train)

model_predictions = random_forest_model.predict(en_features_test)
accuracy = accuracy_score(en_y_test, model_predictions)
print("Accuracy on test set:", accuracy)


test_1 = "The app's exceptional security measures ensure users' peace of mind and protection against any cyber threats. It goes above and beyond industry standards by offering a comprehensive suite of features, including budgeting tools, spending analysis, and personalized financial insights tailored to each user's needs. Barclays' commitment to customer satisfaction is evident in its prompt and attentive customer support, providing users with the assistance they need whenever they have inquiries or concerns. Overall, Barclays has set a new benchmark for mobile banking apps, delighting users with its user-friendly interface, robust security, and unparalleled customer service."
summary = nltk_summarizer(test_1, 1)
print("Text summary:")
print(summary)
test_1_sentiment = analyze_sentiment(test_1)
print("Sentiment of test_1:", test_1_sentiment)


test_2 = "The app offers a range of standard features commonly found in similar applications. While it may not excel in any particular area, it provides a satisfactory user experience for basic banking needs."
summary_2 = nltk_summarizer(test_2, 1)
print("Text summary 2:")
print(summary_2)
test_2_sentiment = analyze_sentiment(test_2)
print("Sentiment of test_2:", test_2_sentiment)

test_3 = "The app's security measures are inadequate, leaving users vulnerable to cyber threats. It lacks essential features and suffers from frequent glitches and errors. Customer support is unresponsive, failing to address users' concerns in a timely manner."
summary_3 = nltk_summarizer(test_3, 1)
print("Text summary 3:")
print(summary_3)
test_3_sentiment = analyze_sentiment(test_3)
print("Sentiment of test_3:", test_3_sentiment)

@app.route('/analyze', methods=['POST'])
def analyze():
    data = request.get_json()
    input_text = data.get('input_text')
    num_lines = input_text.count('\n') + 1
    # Summarize and analyze sentiments
    summary = nltk_summarizer(input_text, num_lines) 
    sentiment = analyze_sentiment(input_text)

    # Return results
    return jsonify({
        'summary': summary,
        'sentiment': sentiment,
    })

if __name__ == '__main__':
    app.run(debug=True)