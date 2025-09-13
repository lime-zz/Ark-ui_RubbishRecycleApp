import {DialogHelper} from '@pura/harmony-dialog'
@Entry

@Component
struct Pinglun {
  @State message: string = 'Hello World';
  @State buttonText: string = '关注讨论'; // 初始文字
  @State isClicked: boolean = false;
  @State isLoding:boolean=false;
datas:Type[]=[
  {img:$r('app.media.touxiang'),name:'默默无闻的产品汪',time:'2019年7月29日',content:'第一步：先将剩余奶茶倒入下水口；第二步：将珍珠、水果肉等残渣丢入湿垃圾；第三部：将被子、吸管丢入干垃圾；第四步：回来帮我点个赞！',likes:'4654',reply:'39条回复'},
  {img:$r('app.media.touxiang'),name:'默默无闻的产品汪',time:'2019年7月29日',content:'这种问题还是得要问神奇的海螺吧！~',likes:'4654',reply:'39条回复'},
  {img:$r('app.media.touxiang'),name:'默默无闻的产品汪',time:'2019年7月29日',content:'我也不知道呀家人们',likes:'4654',reply:'39条回复'}

]
  datas2:Type[]=[
    {img:$r('app.media.touxiang2'),name:'我太难了',time:'2019年7月29日',content:'不需要管那么多',likes:'4654',reply:'39条回复'},
    {img:$r('app.media.touxiang3'),name:'默默无闻的产品汪',time:'2019年7月29日',content:'这种问题还是得要问神奇的海螺吧！~他知道的可多了',likes:'4654',reply:'39条回复'},
    {img:$r('app.media.touxiang'),name:'无敌喵喵',time:'2019年7月29日',content:'评论区学到了',likes:'4654',reply:'39条回复'},
  {img:$r('app.media.touxiang2'),name:'24k纯笨',time:'2019年7月29日',content:'这种问题还是得要问神奇的海螺吧！~',likes:'4654',reply:'39条回复'}
  ]
  onPageShow(): void {
    this.getUIContext().setKeyboardAvoidMode(1);
  }
  @Builder
  itemUI(item:Type)
  {
    Column()
    {
      Row()
      {
       Row()
       {
         Image(item.img)
           .width(40)
           .height(40)
           .borderRadius(20)
         Column()
         {
           Text(item.name)
             .fontColor('#999999')
           Text(item.time)
             .fontColor('#999999')
         }
       }
        //点击变红
        Row(){
          Image($r('app.media.zan'))
            .fillColor(this.isClicked ? '#FF6E8F' : '#999999')
            .onClick(() => {
              this.isClicked = true; // 点击后变红
            })
            .width(20)
            .height(20)
          Text(item.likes)
            .fontColor('#999999')
        }

      }.justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding(7)
     Row()
     {
       Row()
       {

       }
         .width(40)

         Text(item.content)
           .width('90%')
Row()
{

} .width(40)
     }.width('100%')
      Row()
      {
        Row()
        {

        }
        .width(40)
        Text(item.reply)
          .fontColor('#2BCDDD')
      }
      .width('100%')
    }
  }



  build() {

   Column()
   {
   Stack({alignContent:Alignment.Bottom})
   {
   Column()
   {

Column()
{
Row({space:6})
{
 Image($r('app.media.fanhui'))
   .width(20)
   .height(20)
  Text('奶茶究竟应该怎么扔')
    .fontColor('#ffffff')
    .fontSize('25')
    .fontWeight('600')

  Button(this.buttonText)
    .onClick(() => {
      // 点击时更新状态
      this.buttonText = '已关注';
    })
    .fontColor('#2BCDDD')
    .backgroundColor('#ffffff')
    .height(30)
    .width(80)

}
.margin({top:35})
 Row()
 {
Text('29,665人关注    ')
  .fontColor('#ffffff')
  .fontSize(15)
   Text('86条评论')
     .fontColor('#ffffff')
     .fontSize(15)

 }
 .margin({top:40,left:8})
  .width('100%')
}
.height('17%')
     .width('100%')
     .backgroundColor('#2BCDDD')

  Column()
  {
    //精彩讨论列表
Column() {
  Row() {
    Text('    |  ')
      .fontColor('#FF5E81')
      .fontWeight(600)
      .fontSize(15)
    Text('精彩讨论')
      .fontSize(15)
      .fontWeight(600)
  }
  .width('100%')

  .backgroundColor('#ffffff')

  List({ space: 10 }) {
    ForEach(this.datas, (item: Type) => {
      ListItem() {
        this.itemUI(item)
      }
    })

  }
  .width('100%')
  .scrollBar(BarState.Off)
  .backgroundColor('#ffffff')
  .height(230)
}
  //全部讨论列表
  Column()
  {
    Row()
    {
      Text('    |  ')
        .fontColor('#FF5E81')
        .fontWeight(600)
        .fontSize(15)
      Text('全部讨论')
        .fontSize(15)
        .fontWeight(600)
    }
    .width('100%')
    .backgroundColor('#ffffff')
    List({space:10})
    {


      ForEach(this.datas2,(item:Type)=>{
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
              .width(40)
              .height(40)
          }
          .width('100%')
          .justifyContent(FlexAlign.Center)
        }
        .width('100%')
      }
    }
    .width('100%')
    .height(460)
    .backgroundColor('#ffffff')
    .scrollBar(BarState.Off)
    .onScrollIndex((start:number,end:number)=>{
      if(end==this.datas2.length-1)
      {
        this.isLoding=true
        setTimeout(()=>{
          this.isLoding=false;
        },2000

        )
      }
    })
  }
  .margin({top:10})

}.height('70%')
  .width('100%')
.backgroundColor('#ECFDFA')
   }
   .width('100%')
   .height('100%')
  Row({space:5})
  {
    TextArea({placeholder:'下一个热评说不好就是你'})
      .backgroundColor('white')
      .height(40)
      .width('70%')
      .backgroundColor('#F2F2F2')
      .fontColor('#999999')
      Image($r('app.media.biaoqing'))
        .height(40)
        .width(40)

    Button('发送')
      .fontColor('#ffffff')
      .backgroundColor('#FF6E8F')
      .height(40)
      .width(60)
      .onClick(()=>
      {
        DialogHelper.showToastTip({
          message: "已发送",
          imageRes: $r('sys.media.ohos_ic_public_ok')
        })
      })
  }
.height(70)
     .width('100%')


   }



   }
   .height('100%')
   .width('100%')


  }
}interface  Type{
  img:Resource
  name:string
  time:string
  content:string
  likes:string
  reply:string

}