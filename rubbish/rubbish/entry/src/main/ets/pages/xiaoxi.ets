
@Entry
@Component
struct Xiaoxi {
  @State message: string = 'Hello World';
  @State currentIndex:number=0;
  //Swiper控制器
  swiperController:SwiperController = new SwiperController();
  build() {
Column()
{//上面导航栏
    Row()
    {
      Image($r('app.media.fanhui'))
        .height(20)
        .width(20)
        .margin({left:10})
      Column()
        .width('30%')
      Row({space:50})
      {
        Text('通知')
          .fontSize(this.currentIndex==0?'25':'20')
          .fontColor(this.currentIndex==0?'#FF5E81':'#FFFFFF')
          .onClick(()=>{
            this.currentIndex=0;
            this.swiperController.changeIndex(0)
          })
        Text('私信')
          .fontSize(this.currentIndex==1?'25':'20')
          .fontColor(this.currentIndex==1?'#FF5E81':'#FFFFFF')
          .onClick(()=>{
            this.currentIndex=1;
            this.swiperController.changeIndex(1)
          })
      }
    }
  .width('100%')
  .backgroundColor('#2BCDDD')
  .height('15%')

  Swiper(this.swiperController){
    tongzhi()
    sixin()

  }
  .onChange(index=>{
    this.currentIndex = index
  })
  .indicator(false) //去掉导航点
  .width('100%')
  .layoutWeight(1)  //占据剩下的高度
.backgroundColor('#ECFDFA')
}


  }
}

interface  Type2{
  img1:Resource
  title:string
  content:string
  time:string
}
@Component
struct tongzhi {
  //模拟数据
  datas:Type2[]=[
    {img1:$r('app.media.tubiao'),title:'OMINI人民广场自助回收机',content:'自助回收成功',time:'8-13'},
    {img1:$r('app.media.tubiao'),title:'OMINI人民广场自助回收机',content:'自助回收成功',time:'8-13'},
    {img1:$r('app.media.tubiao'),title:'OMINI人民广场自助回收机',content:'自助回收成功',time:'8-13'},
    {img1:$r('app.media.tubiao'),title:'OMINI人民广场自助回收机',content:'自助回收成功',time:'8-13'},
    {img1:$r('app.media.tubiao'),title:'OMINI人民广场自助回收机',content:'自助回收成功',time:'8-13'},
    {img1:$r('app.media.tubiao'),title:'OMINI人民广场自助回收机',content:'自助回收成功',time:'8-13'},
    {img1:$r('app.media.tubiao'),title:'OMINI人民广场自助回收机',content:'自助回收成功',time:'8-13'},
    {img1:$r('app.media.tubiao'),title:'OMINI人民广场自助回收机',content:'自助回收成功',time:'8-13'},
    {img1:$r('app.media.tubiao'),title:'OMINI人民广场自助回收机',content:'自助回收成功',time:'8-13'}
  ]
@Builder
itemUI(item:Type2)
{
  Row()
  {
   Row()
   {
     Image(item.img1)
       .width(40)
       .height(40)
     Column()
     {
       Row()
       {
         Text(item.title)
           .fontSize(20)
       }
       .justifyContent(FlexAlign.Start)
       .width('100%')
       .margin({left:8})
       Row()
       {

         Text(item.content)
           .fontSize(15)
           .fontColor('#999999')

       }
       .justifyContent(FlexAlign.Start)
       .width('100%')
       .margin({left:8})
     }
   }
    Text(item.time)
      .fontColor('#999999')
      .fontSize(15)
  }
  .justifyContent(FlexAlign.SpaceBetween)
  .backgroundColor('#ffffff')
  .borderRadius(20)
  .height(65)
  .margin({top:8})
  .width('100%')
}



  build() {
Column()
{
  //列表展示
  List({space:10})
  {
    ForEach(this.datas,(item:Type2)=>{
      ListItem()
      {
        this.itemUI(item)
      }
    })

  }
.width('90%')
  .scrollBar(BarState.Off)


}
.width('100%')



  }
}
interface  Type3{
  img2:Resource
  name:string
  content:string
  time:string
}
@Component
struct sixin {
  //模拟数据
  datas:Type3[]=[
    {img2:$r('app.media.touxiang'),name:'OMINI.BASS',content:'快来看看这个咋样？',time:'8-13'},
    {img2:$r('app.media.touxiang'),name:'OMINI.BASS',content:'什么时候才能跟大佬一样优秀？',time:'8-13'},
    {img2:$r('app.media.touxiang'),name:'OMINI.BASS',content:'快来看看这个咋样？',time:'8-13'},
    {img2:$r('app.media.touxiang'),name:'OMINI.BASS',content:'快来看看这个咋样？',time:'8-13'},
    {img2:$r('app.media.touxiang'),name:'OMINI.BASS',content:'快来看看这个咋样？',time:'8-13'},
    {img2:$r('app.media.touxiang'),name:'OMINI.BASS',content:'快来看看这个咋样？',time:'8-13'},
    {img2:$r('app.media.touxiang'),name:'OMINI.BASS',content:'快来看看这个咋样？',time:'8-13'},
    {img2:$r('app.media.touxiang'),name:'OMINI.BASS',content:'快来看看这个咋样？',time:'8-13'},
    {img2:$r('app.media.touxiang'),name:'OMINI.BASS',content:'快来看看这个咋样？',time:'8-13'},
    {img2:$r('app.media.touxiang'),name:'OMINI.BASS',content:'快来看看这个咋样？',time:'8-13'}
  ]
  @Builder
  itemUI(item:Type3)
  {
    Row()
    {
      Row()
      {
        Image(item.img2)
          .width(40)
          .height(40)
          .borderRadius(20)
        Column()
        {
          Row()
          {
            Text(item.name)
              .fontSize(20)
          }
          .justifyContent(FlexAlign.Start)
          .width('100%')
          .margin({left:8})
          Row()
          {

            Text(item.content)
              .fontSize(15)
              .fontColor('#999999')

          }
          .justifyContent(FlexAlign.Start)
          .width('100%')
          .margin({left:8})
        }

      }
      Text(item.time)
        .fontColor('#999999')
        .fontSize(15)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor('#ffffff')
    .borderRadius(20)
    .height(65)
    .margin({top:8})
    .width('100%')
  }
//是否下拉刷新
  @State isRefresh:boolean=false;
//是否上拉加载
  @State isLoding:boolean=false;
  build() {

    Column()
    {
      //列表展示
     Refresh({refreshing:$$this.isRefresh,promptText:'正在加载中...'})
     {
       List({space:10})
       {
         ForEach(this.datas,(item:Type3)=>{
           ListItem()
           {
             this.itemUI(item)
           }
         })
if(this.isLoding)
{
  ListItem()
  {
    Row({space:5})
    {
      Text('没有更多了')
      LoadingProgress()
        .width(20)
        .height(20)
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
  .width('100%')
}
       }
       .width('90%')
       .scrollBar(BarState.Off)
.onScrollIndex((start:number,end:number)=>{
  if(end==this.datas.length-1)
  {
    this.isLoding=true
    setTimeout(()=>{
      this.isLoding=false;
    },2000

    )
  }
})
     }
.onRefreshing(()=>{//当刷新时会自动调用此函数
  //只执行一次
  setTimeout(()=>{this.isRefresh=false;},2000)

   })
    }
    .width('100%')

  }
}