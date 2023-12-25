const book = {
  title: 'hello js',
  author: 'jinsu'
}

const updated = { ...book, title: 'hello ruby' }

// 2개의 object
const book = {
  title: 'hello js',
  author: 'jinsu'
}


const changeBook = {
  title: 'hello ruby',
}

// const bookWithChangeBook = Object.assign({}, book, changeBook)
const bookWithChangeBook = { ...book, ...changeBook }
