const defaultEmployee = {
  name: {
    first: '',
    last: ''
  },
  years: 0
}

const employee2 = Object.assign(
  {},
  defaultEmployee,
  {
    name: Object.assign({}, defaultEmployee.name)
  }
)

export { defaults }
