const colors = ['black', 'black', 'brown']

const uniqueColors = new Set(colors) //  Set { 'black', brown'' }

const getUniqueColor = (attributes) => {
  return [...new Set(attributes)]
}
