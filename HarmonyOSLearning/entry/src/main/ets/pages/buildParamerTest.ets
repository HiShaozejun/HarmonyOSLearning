// 全局自定义构建函数
@Builder function globalBuilderFunc() {
}

@Component
struct MyChild {

  // 组件内自定义构建函数
  @Builder doNothingBuilder() {}

  /// 使用自定义组件的自定义构建函数初始化@BuilderParam
  @BuilderParam customBuilderParam: () => void = this.doNothingBuilder
  // 使用全局自定义构建函数初始化@BuilderParam
  @BuilderParam customGlobalBuilderParma: () => void = globalBuilderFunc

  build() {

  }
}

//////////////////////

/**
 * @BuilderParam装饰的方法类型需要和@Builder方法类型一致。
 */
@Component
struct MyChild1 {
  label: string = "MyChild1 -- builder"
  // 使用父组件@Builder装饰的方法初始化子组件@BuilderParam
  @BuilderParam buildComponent: () => void

  build() {
    Column() {
      this.buildComponent()
    }
  }
}

// @Entry
@Component
struct Parent {
  label: string = 'Parent -- builder'

  // 注意 this代表的指向对象
  @Builder buildWidget() {
    Text(`${this.label}`).fontColor(Color.Red).fontSize(24)
  }

  build() {
    Column() {
      this.buildWidget()
      MyChild1({ buildComponent: this.buildWidget })
    }.margin(20)
  }
}

///////////////////////////
/**
 *  尾随闭包
 */


@Component
struct MyChild2 {
  @Prop content: string

  // 父类传递过来，回调无参数
  @BuilderParam callParentBuildWithVoid?: () => void

  build() {
    Column() {
      Text(this.content).fontSize(24).fontColor(Color.Pink)
      if (this.callParentBuildWithVoid) this.callParentBuildWithVoid()
    }
  }
}

@Component
struct MyChild3 {
  // 回调用父类函数
  @BuilderParam callParentBuilder3: () => void

  build() {
    Column() {
      Text('child 3').fontColor(Color.Green).fontSize(28)
      this.callParentBuilder3()
    }
  }
}

@Component
struct MyChild4 {
  // 回调用父类函数
  @BuilderParam callParentBuilder4: (text1: string, text2: string) => void

  build() {
    Column() {
      Text('child 4').fontColor(Color.Green).fontSize(28)
      this.callParentBuilder4(' hello', 'world')

    }
  }
}


// 全局自定义构建函数
@Builder function globalBuilderFunc1(text1: string, text2: string) {
  Column() {
    Text(text1).fontSize(23).fontColor(Color.Yellow)
    Text(text2).fontSize(23).fontColor(Color.Red)
  }.backgroundColor(Color.Gray).width(200)
}

@Entry
@Component
struct MyParent1 {
  @State parentContent: string = "build Param参数"

  @Builder buildParentWidget() {
    Text(`${this} -- ${this.parentContent}}`).fontColor(Color.Blue).fontSize(23)
  }

  build() {
    Column({ space: 10 }) {

      this.buildParentWidget()
      Divider()
      // 值传递
      MyChild2({ content: "my child 初始化了" ,callParentBuildWithVoid:()=>{

      }})
      Divider()
      // 尾随闭包
      MyChild2({ content: this.parentContent }) {
        Column() {
          Text('尾随闭包').fontSize(18).fontColor(Color.Gray)
          this.buildParentWidget()
        }
      }

      Divider()
      // 尾随闭包
      MyChild3() {
        globalBuilderFunc1('child3 text1', 'child3 -text2')
      }

      MyChild3({ callParentBuilder3: () => {
        this.buildParentWidget()
      } })

      // 参数回传到父组件
      MyChild4({ callParentBuilder4: (text1: string, text2: string) => {
        // globalBuilderFunc1(text1, text2)
        this.buildParentWidget()
      } })
    }.margin({ top: 20 }).justifyContent(FlexAlign.Center).width('100%')
  }
}

/*


 */