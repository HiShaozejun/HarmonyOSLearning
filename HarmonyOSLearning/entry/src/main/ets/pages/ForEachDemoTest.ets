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
struct ArticleComponent {
  public article: Article

  build() {
    Row() {
      Image($r('app.media.icon')).width(80).height(80).margin({ right: 20 })
      Column({ space: 10 }) {
        Text(`第${this.article.id} ${this.article.name}`).fontSize(20).fontColor(Color.Black).margin({ bottom: 10 })
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
  @State isLast: boolean = false
  aric: Article[] = [new Article(1, '文章标题', '文章副标题'), new Article(2, '文章标题', '文章副标题'), new Article(3, '文章标题', '文章副标题'), new Article(4, '文章标题', '文章副标题'), new Article(5, '文章标题', '文章副标题'), new Article(6, '文章标题', '文章副标题'), new Article(7, '文章标题', '文章副标题'), new Article(8, '文章标题', '文章副标题'),]

  build() {
    Column() {
      List() {
        ForEach(this.aric, (item: Article) => {
          ListItem() {
            ArticleComponent({ article: item }).margin(10)
          }
        },)
      }.onReachEnd(() => {
        this.isLast = true

      }).parallelGesture(PanGesture({ direction: PanDirection.Up, distance: 20 }).onActionStart(() => {
        if (this.isLast) {
          let count = this.aric.length
          count += 1
          this.aric.push(new Article(count, "文章标题", '文章副标题'))
          this.isLast = false
        }
      }))
    }
  }
}