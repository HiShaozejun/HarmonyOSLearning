import router from '@ohos.router'
@Entry
@Component
// 声明UI
struct ArkTsGrammar{

  private url: string = "https:"

  @State text: string = 'jason'

  clickFunc(event: ClickEvent): void{
    console.info(this.url)
  }

  build(){
    Column(){
      Image(this.url)
      Text($rawfile('string'))
      Text(`hello ${this.text}`).fontSize(24).fontColor(Color.Red).onClick(()=>{
        console.log(this.text)
      })
      Text($r("app.string.app_name")).fontSize(30)
      Button("路由返回").onClick(()=>{
        router.back()
      })

      Button("函数封装调用").onClick(this.clickFunc.bind(this))

      CustomWidget({widgetName:"自定义组件"})
    }.padding(20)
  }
}

// 自定义组件
@Component
struct CustomWidget {
  // 不可以定义静态变量
  // static name: string = '';

  widgetName: string

  // 成员变量
  private age: number = 1;

  //自定义构建函数 将相同的UI组件抽离到builder函数体中
  @Builder MyBuilderWidget(){
    Text("11")
    Text($r('app..stringValue'))
  };

  // 根节点必须唯一
  build(){
    Column(){
      // 可以为非容器组件
      Image("")
      this.MyBuilderWidget()
      // 容器组件
      //   Row(){}
      // 不可以使用表达式
      //   (age > 1) ? Text() : Text()
    }

  }
}

