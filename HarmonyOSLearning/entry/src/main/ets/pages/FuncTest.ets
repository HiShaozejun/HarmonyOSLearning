
// 全局自定义构建函数，按值传递参数
@Builder function myBuilderFunc1(name: string,userId: number){
  Column(){
    Text('值传递自定义函数')
    Text(`hello ${name},当前userId:${userId}`).fontSize(40).margin(30)
  }
}

// 全局自定义构建函数：按引用传递参数
@Builder function  myBuilderFunc2($$:{name: string,userId: number}){
  Column(){
    Text('引用传递自定义函数')
    Text(`hello ${$$.name} userId: ${$$.userId}`).fontSize(40).fontColor(Color.Red)
  }
}

@Entry
@Component
struct  Parent{
  @State userName:string = 'shaozj'
  @State userId: number = 12;

  // 内部自定义函数，只能在组件内访问
  @Builder innerFunc(){
    Column(){
      Text('内部自定义函数')
      Text(`name:${this.userName} userId:${this.userId}`).fontSize(40).fontColor(Color.Red)
    }
  }
  
  build(){
    Column(){
      Divider()
      // 按值传递函数调用，状态变量的改变，不会自动触发@builder函数的刷新
      myBuilderFunc1(this.userName,this.userId)
      // 按引用传递函数调用，状态变量的改变，会自动触发@builder函数的刷新
      myBuilderFunc2({name: this.userName,userId: this.userId})
      // 内部函数调用
      this.innerFunc()
      Button('修改变量').onClick(()=>{
        this.userName = '赵四';
        this.userId = 22;
      })
    }
  }
}