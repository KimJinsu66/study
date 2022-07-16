const callback = (collectedValues, item) {
  return [...collectedValues, item]
}

const saying = ['veni', 'vedi', 'veci']
const initialValues = []
const copy = saying.reduce(callback, initialValues)


const dogs = [
  {
    name: 'dog1',
    size: 10,
    color: 'brown'
  },
  {
    name: 'dog2',
    size: 15,
    color: 'white'
  },
  {
    name: 'dog3',
    size: 20,
    color: 'black'
  }
]

// map
dogs.map(dog => dog.color)

// reduce
const colors = dogs.reduce((colors, dog) => {
  if (colors.includes(dog['color'])) {
    return colors
  }

  return [...colors, dog['color']]
}, [])
