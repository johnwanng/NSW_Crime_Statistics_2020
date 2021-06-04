
from pickle import dump, load
from sklearn.svm import SVC

storedModel = load(open('model.sav', 'rb'))
# load the scaler
storedScaler = load(open('scaler.sav', 'rb'))
prediction = [[4,6,2,5,6,7,1,2,127]]

#print(ageList)
scaled_prediction = storedScaler.transform(prediction)
p = storedModel.predict(scaled_prediction)

def result(prediction):
    result = 'False'
    if prediction[0] == 1:
        result = 'True'
    return result    

print(result(p))

