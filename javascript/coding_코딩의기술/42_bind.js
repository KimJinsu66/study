// bind()로 문맥 문제를 해결하라

function sayMessage() {
  return this.message;
}

const alert = {
  message: '위험해!'
}

const sayAlert1 = sayMessage()
console.log(sayMessage())

const sayAlert2 = sayMessage.bind(alert)
console.log(sayAlert2())
