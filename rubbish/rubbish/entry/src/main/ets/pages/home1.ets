@Component
export struct home1 {
  //Swiper控制器
  swiperController:SwiperController = new SwiperController();
  //定义变量记录当前Swiper的下标
  @State currentIndex:number = 0;
  build() {
    Column(){
      //标题
      Row(){
        Row().width(24)

        Text('关注')
          .fontColor(this.currentIndex == 0 ? '#000000':'#999999')
          .fontSize(this.currentIndex == 0 ? '28' : '20')
          .onClick(()=>{
            this.currentIndex = 0
            this.swiperController.changeIndex(0)
          })
        Text('发现')
          .fontColor(this.currentIndex == 1 ? '#000000':'#999999')
          .fontSize(this.currentIndex == 1 ? '28' : '20')
          .onClick(()=>{
            this.currentIndex = 1
            this.swiperController.changeIndex(1)
          })
        Text('广场')
          .fontColor(this.currentIndex == 2 ? '#000000':'#999999')
          .fontSize(this.currentIndex == 2 ? '28' : '20')
          .onClick(()=>{
            this.currentIndex = 2
            this.swiperController.changeIndex(2)
          })
        Image($r("app.media.img3_3"))
          .width(24)
          .height(24)
      }
      .padding(10)
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      //关注、发现、广场
      Swiper(this.swiperController){
        Guanzhu()
        Faxian()
        Guangchang()
      }
      .onChange(index=>{
        this.currentIndex = index
      })
      .indicator(false) //去掉导航点
      .width('100%')
      .layoutWeight(1)  //占据剩下的高度
    }
    .padding(15)
    .width('100%')
    .height('100%')
  }
}

@Component
struct Guanzhu {
  build() {
    Column(){
      Text('关注')
    }
  }
}
@Component
struct Faxian {
  build() {
    Column(){
      Text('发现')
    }
  }
}

interface Type1{
  img:Resource
  title:string
  contents:number
  joins:number
}

@Component
struct Guangchang {
  //数据(模拟数据)
  datas:Type1[] = [
    {img:$r('app.media.startIcon'),title:'数码相机',contents:20.2,joins:12.3},
    {img:$r('app.media.startIcon'),title:'手机',contents:21.2,joins:22.3},
    {img:$r('app.media.startIcon'),title:'手机1',contents:21.21,joins:2.3},
    {img:$r('app.media.startIcon'),title:'手机2',contents:21.22,joins:22.3},
    {img:$r('app.media.startIcon'),title:'手机3',contents:21.23,joins:23.3},
    {img:$r('app.media.startIcon'),title:'手机4',contents:21.24,joins:24.3},
    {img:$r('app.media.startIcon'),title:'手机5',contents:21.24,joins:24.3},
    {img:$r('app.media.startIcon'),title:'手机6',contents:21.24,joins:24.3},
    {img:$r('app.media.startIcon'),title:'手机7',contents:21.24,joins:24.3},
  ]
  //UI
  @Builder
  hotItems(data:Type1){
    Row({space:15}){
      Image(data.img)
        .width(60)
        .height(60)
        .borderRadius(12)
      Column({space:10}){
        Text(data.title)
          .fontSize(20)
          .fontWeight(600)
          .width('100%')
        Text(data.contents+'w内容 · '+data.joins +'w人参与')
          .fontSize(14)
          .fontColor('#999999')
          .width('100%')
      }
    }
    .margin({ top:10 })
    .borderRadius(18)
    //随机0~2  [0~1) -> [0,3)
    .backgroundColor(this.colors[Math.floor(Math.random()*3)])
    .width('100%')
    .padding(15)
  }

  //定义颜色数组
  colors:string[] = ['#ff0000','#00ff00','#0000ff']


  build() {
    Column(){
      Text('轮播图')

      Scroll(){
        Column(){
          //列表
          //参数1：数组
          ForEach(this.datas,(item:Type1)=>{
            this.hotItems(item)
          })
        }
      }
      .scrollBar(BarState.Off)
    }
  }
}
