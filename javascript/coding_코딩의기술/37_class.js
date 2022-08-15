// TIP 37: 읽기 쉬운 클래스를 만들어라

class Coupon {

  constructor(price, expiration) {
    this.price = price
    this.expiration = expiration || '2week'
  }

  getExpirationMessage() {
    return `이 쿠폰은 ${this.expiration}후에 만료됩니다`
  }
}

const coupon = new Coupon(4);
console.log(coupon.getExpirationMessage())
