class Article {
  public id: number
  public name: string
  public content: string

  constructor(id: number, name: string, content: string) {
    this.id = id
    this.name = name
    this.content = content

  }
}

@Component
struct ActicleCompent {
  public article: Article

  build() {
    Row() {
      Image($r('app.media.icon')).width(80).height(80).margin({ right: 20 })
      Column({ space: 10 }) {
        Text(this.article.name).fontSize(20).fontColor(Color.Black).margin({ bottom: 10 })
        Text(this.article.content).fontSize(16).fontColor(Color.Gray)
      }.alignItems(HorizontalAlign.Start).width('80%').height('100%')
    }
    .padding(20)
    .borderRadius(12)
    .backgroundColor('#FFECECEC')
    .height(120)
    .width('100%')
    .justifyContent(FlexAlign.Start)
  }
}

@Entry
@Component
struct MyParent {
  build() {

  }
}