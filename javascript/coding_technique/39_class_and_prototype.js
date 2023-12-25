// TIP 39: 클래스로 기존의 프로토타입을 확장

// prototye을 사용하는 경우
// class의 경우 TIP 36을 참고

function Coupon(price, expiration) {
  this.price = price
  this.expiration = expiration || '2week'
}

const coupon = new Coupon(5, '2month')

console.log(coupon.price)

// Class 키워드를 이용해서 객체를 생성할 때도 프로토타입을 생성하고 문맥을 바인딩한다
Coupon.prototype.getExpirationMessage = function () {
  return `이 쿠폰은 ${this.expiration} 뒤에 만료됩니다`
}

console.log(coupon.getExpirationMessage())


// refereunce
// [Js Class 와 prototype 의 차이](https://medium.com/@flqjsl/js-class-%EC%99%80-prototype-%EC%9D%98-%EC%B0%A8%EC%9D%B4-7dc1d7531ae0)
