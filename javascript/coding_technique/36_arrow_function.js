// TIP 36 화살표 함수로 문맥 혼동을 피하라
// 화살표 함수는 함수를 호출할 때 this 바인딩을 새로 만들지 않는다

const validator = {
  message: 'test',
  setInvalidMessages(...fields) {
    return fields.map(field => {
      return `${field}: ${this.message}`
    })
  }
}

console.log(validator.setInvalidMessages('city'))

// 아래와 같이 속성에 할당하는 경우 this를 바인딩 하지 않는다
const validator2 = {
  message: 'test',
  setInvalidMessages: field => `${field}: ${this.message}`
}

console.log(validator2.setInvalidMessages('city'))
