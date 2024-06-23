// 状态管理

class Person {
  public name: string
  public age: number

  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
}

@Component
struct MyChild {

  // 状态变量定义，状态变量值的改变会触发UI界面刷新，必须进行初始化
  @State person: Person = new Person('Jason', 0)

  // 普通变量定义,变量值的改变不会触发UI界面刷新，通常用作辅助计算
  private inCrease: number = 0

  build() {
    Column() {
      Blank().height(30)
      Text(`name:${this.person.name}; age: ${this.person.age}`).fontSize(30).fontColor(Color.Red)
      Button('修改一下').onClick(() => {
        this.inCrease++;
        this.person.name = `${this.person.name}` + `${this.inCrease}`
        this.person.age = this.inCrease
      })
    }
  }
}


@Entry
@Component
struct Parent {
  build() {
    Column() {
      MyChild({ person: new Person('李四', 1) })
      MyChild({ inCrease: 0 })
    }
  }
}
