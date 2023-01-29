# Browser

## 참고 사이트

- [Vanilla Javascript로 가상돔(VirtualDOM) 만들기](https://junilhwang.github.io/TIL/Javascript/Design/Vanilla-JS-Virtual-DOM/#_1-%E1%84%87%E1%85%B3%E1%84%85%E1%85%A1%E1%84%8B%E1%85%AE%E1%84%8C%E1%85%A5-%E1%84%85%E1%85%A9%E1%84%83%E1%85%B5%E1%86%BC-%E1%84%80%E1%85%AA%E1%84%8C%E1%85%A5%E1%86%BC)

- [Reflow, Repaint 와 7가지 렌더링 최적화방법](https://ekimnida.tistory.com/45)

## Loading 과정

파싱 → 스타일 → 레이아웃 → 페인트 → 합성 → 렌더 등의 과정

→ 실제로 해보면 좋을 듯

## Virtual Dom조작 vs Dom조작

### Diff 알고리즘

https://ko.reactjs.org/docs/reconciliation.html#the-diffing-algorithm


### Summary

- 태그가 변경되면서 변화가 있을 경우에 reflow가 발생하고, reflow는 비용이 매우 크다.
- reflow를 최소화하기 위해서 가상돔(VirtualDOM)(VirtualDOM)이 등장했다.
- VirtualDOM의 가독성이 좋지 않기 때문에 JSX라는 것을 사용한다.
- VirtualDOM 보다 더 중요한 것은 DIFF 알고리즘이다.
  - 굳이 VirtualDOM을 사용하지 않아도 된다.
