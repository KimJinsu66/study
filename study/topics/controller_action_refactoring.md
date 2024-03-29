
# Controller 액션을 리팩터링하자

- 작성일: 2023/02/10

## 시간

11:00 ~ 11:30

## 문제점

- Index액션에 검색, csv출력, 리스트작업을 동시에 진행하고 있다.
- Index Action안에서 50줄이 넘는 동작을 진행하고 있음
- 좀 더 적절하게 나누면 좋을 것 같다고 생각함

## 과정

- Form아키텍처 검색
  - 메리트
    - model과 form에서 입력값 검증인지 비즈니스 로직 검증인지 구분할 수 있다.
    - 동일한 처리를 model에 대해 실시할 때에 Form층의 재사용이 가능해진다.
    - 비즈니스 로직을 controller/view에서 분리할 수 있다(단일 책무 상태).

### 설계

# Before
IController#Index - IModel

# After
IController#Index - IForm#items - IModel
ICSVController#Create

### 주의해야할점

- instance variable가 사용되고 있음
  - 어디까지 영향을 미치는지 확인할 필요가 있다


아래의 예시처럼 조건이 있을 때 아래의 동작이 실행되는 것은 피하고 싶음
따라서 Form Object를 사용하여 로직을 합친 뒤 각각의 Controller에서 call할 수 있도록 수정
```ruby
# Something logic

return unless 조건

# Something logic
```

### --- 11:00 ~ 11:30

- 손을 움직이면서 어떻게 나눠야 하는지 문제점이 뭔지 알아 볼 수 있었다
  - 지금은 30분정도 결렸지만 이렇게 목표를 설정하고 먼저 조사하는 시간이 사양에 있어서도 많은 도움이 될듯

## 해결책

## 실행

## 배운점

## 참고사이트

- [Railsのデザインパターン: Formオブジェクト](https://applis.io/posts/rails-design-pattern-form-objects)
- [Rails Test case](https://applis.io/posts/how-to-create-test-cases)
