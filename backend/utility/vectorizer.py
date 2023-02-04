import numpy as np

def vectorize(interests):
    hashmap = {
        'art_gallery' : 0,
        'bar' : 1,
        'gym' : 2,
        'night_club' : 3,
        'library' : 4,
        'cafe' : 5,
        'campground' : 6,
        'casino' : 7,
        'shopping_mall' : 8,
        'park' : 9,
        'museum' : 10,
        'zoo' : 11,
        'airport' : 12,
        'bicycle_store' : 13
    }

    binary_interests = [0] * 14

    for i in interests:
        binary_interests[hashmap[i]] = 1
    
    return binary_interests

def compare(interests1, interests2):
    interests1, interests2 = np.array(interests1), np.array(interests2)
    return np.dot(interests1, interests2) / (magnitude(interests1) * magnitude(interests2))

def magnitude(vector):
    return np.sqrt(np.sum(vector ** 2))