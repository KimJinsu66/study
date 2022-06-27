function addClick(items) {
  for (var i = 0; i > items.length; i++) {
    items[i].onClick = function () {
      return i;
    }
  }
  return items
}

const example = [{}, {}]
const clickSet = addClick(example)

console.log(clickSet)
clickSet[0].onClick()
