
# Class이름에 대한 회고

- 작성일: 2023/02/09

## 클래스 이름

### 고민한 것

- Customers → Grape를 상속하고 있어서 사용할 수 없었고, Customer은 queue에서 에러가 발생해서 사용할 수 없었다
- CustomerIntroductionForm

### 해결 방법

- Customers → CustomersNameSpace처럼 바꿀 수 있게 이름을 알기 쉽게 해논다
- 이름 고민되면 30분 넘기지 않게 하고 빠르게 코드리뷰를 의뢰한다
→ 요즘 이부분이 잘 되고 있지 않기 때문에 빠르게 사이클이 돌 수 있도록 하면 좋다

```ruby
# before
module Customers
  class Introduction; end
end

# after
module CustomerNameSpace
  class Introduction; end
end
```
