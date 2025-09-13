import { router } from '@kit.ArkUI';
import {DialogHelper} from '@pura/harmony-dialog'

@Entry
@Component

export struct Taolun2 {
  swiperController:SwiperController =new SwiperController();
  //定义变量记录当前Swiper的下标
  @State currentIndex:number=0;
  build() {
    Column()
    {
      //标题
     Column()
     {
       Row()
       { Image($r('app.media.fanhui'))
         .width(24)
         .height(24)
         Text('讨论')
           .fontColor('#E8E8E8')
           .fontSize(27)
         Row()
           .width(154)
         Image($r('app.media.jiahao'))
           .width(24)
           .height(24)
         Image($r('app.media.sousuo'))
           .width(24)
           .height(24)
       }
       .padding(10)
       .width('100%')
       .justifyContent(FlexAlign.SpaceBetween)

       //导航栏
       Row()
       {
         Row()
         {

         }
         .width(14)
         Text('热门')
           .fontSize(this.currentIndex==0?'25':'20')
           .fontColor(this.currentIndex==0?'#FF5E81':'#FFFFFF')
           .onClick(()=>{
             this.swiperController.changeIndex(0)
             this.currentIndex=0;
           })
         Text('闲置')
           .fontSize(this.currentIndex==1?'25':'20')
           .fontColor(this.currentIndex==1?'#FF5E81':'#FFFFFF')
           .onClick(()=>{
             this.swiperController.changeIndex(1)
             this.currentIndex=1;
           })
         Text('求助')
           .fontSize(this.currentIndex==2?'25':'20')
           .fontColor(this.currentIndex==2?'#FF5E81':'#FFFFFF')
           .onClick(()=>{
             this.swiperController.changeIndex(2)
             this.currentIndex=2;
           })
         Text('吐槽')
           .fontSize(this.currentIndex==3?'25':'20')
           .fontColor(this.currentIndex==3?'#FF5E81':'#FFFFFF')
           .onClick(()=>{
             this.swiperController.changeIndex(3)
             this.currentIndex=3;
           })
         Text('社区')
           .fontSize(this.currentIndex==4?'25':'20')
           .fontColor(this.currentIndex==4?'#FF5E81':'#FFFFFF')
           .onClick(()=>{
             this.swiperController.changeIndex(4)
             this.currentIndex=4;
           })
         Image($r('app.media.santiaogang'))
           .width(24)
           .height(24)
           .onClick(()=>{
             //选择类弹出框
             DialogHelper.showSelectDialog({
               radioContent: ["默认排序", "最新发表", "最新回复", "最多回复", "最多浏览"],
               onCheckedChanged: (index) => {

               },
               onAction: (action, dialogId, value) => {

               }

             })
           })


       }
       .padding(10)
       .width('100%')
       .justifyContent(FlexAlign.SpaceBetween)
     }.backgroundColor('#2BCDDD')
      .padding(20)


      //热门，闲置，求助，吐槽，社区
      Swiper(this.swiperController)
      {
        remen()
        xianzhi()
        qiuzhu()
        tucao()
        shequ()

      }
      .onChange(index=>{
        this.currentIndex=index
      })
      .indicator(false)//去掉导航点
      .width('100%')
      .layoutWeight(1)//占据剩下的高度
    }
    .width('100%')
    //.padding(15)
    .height('100%')
  }
}

//热门
@Component
struct remen{
  //数据（模拟）
  datas:Type1[]=[

    {imgtu:$r('app.media.imgtu5'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶应该怎么扔',name:'OMINI.BASS',contents:'一杯奶茶有奶有茶有吸管，应该怎么分类才对',pinlun:25684},
    {imgtu:$r('app.media.imgtu5'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶应该怎么扔',name:'OMINI.BASS',contents:'一杯奶茶有奶有茶有吸管，应该怎么分类才对',pinlun:25684},
    {imgtu:$r('app.media.imgtu5'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶应该怎么扔',name:'OMINI.BASS',contents:'一杯奶茶有奶有茶有吸管，应该怎么分类才对',pinlun:25684},
    {imgtu:$r('app.media.imgtu5'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶应该怎么扔',name:'OMINI.BASS',contents:'一杯奶茶有奶有茶有吸管，应该怎么分类才对',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'一杯奶茶有奶有茶有吸管，应该怎么分类才对',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},

  ]
  //UI
  @Builder

  remenItems(data:Type1)
  {

    Column({space:0})
    {

      Text(data.title)
        .width('100%')
      Row({space:5})
      {

        Text(data.contents)
          .width('75%')
        Image(data.imgtu)
          .width(95)
          .height(80)
          .borderRadius(12)
      }.padding(5)
      .width('100%')
      Row()
      {
        Image(data.imgtouxiang)
          .width(30)
          .height(30)
          .borderRadius(20)
        Text(data.name)
        Column()
        {

        }
        //.width(120)
        Image(data.imgpin)
          .width(24).height(24)
          .onClick(() => {
            router.pushUrl({ url: 'pages/pinglun' })
          })
        Text(data.pinlun+' ')

      }

      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }.width('100%')
    // .height('')
    // .margin({ top:10 })

    .padding(15)
  }

  build() {
    Column()
    {
      Column({space:20}){
        Row({space:8}){
          //占位
          Row(){}.width(5)
          Image($r('app.media.taoluntongzhi'))
            .width(25)
            .height(25)
          Text('关于近期服务器故障的说明')
            .fontSize(20)
        }
        .width('100%')
        .height(50)
        .justifyContent(FlexAlign.Start)
        Row({space:8}){
          //占位
          Row(){}.width(5)
          Image($r('app.media.taoluntongzhi'))
            .width(25)
            .height(25)
          Text('关于近期服务器故障的说明')
            .fontSize(20)
        }
        .width('100%')
        .height(50)
        .justifyContent(FlexAlign.Start)
        Row({space:8}){
          //占位
          Row(){}.width(5)
          Image($r('app.media.taoluntongzhi'))
            .width(25)
            .height(25)
          Text('关于近期服务器故障的说明')
            .fontSize(20)
        }
        .width('100%')
        .height(50)
        .justifyContent(FlexAlign.Start)

      }

      Scroll()
      {
        Column()
        {
          //列表
          //参数1：数组
          ForEach(this.datas,(item:Type1)=>{
            this.remenItems(item)
          })
        }
      }


    }
  }
}

//闲置
@Component
struct xianzhi{
  //数据（模拟）
  datas:Type1[]=[

    {imgtu:$r('app.media.imgtu1'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'\n' +
      '闲置很久的杯子，特别喜欢就一直看着没用。现在出啦，25OMINI币即可带走！~\n' +
      '\n' +
      '先到先得~！',pinlun:25684},
    {imgtu:$r('app.media.imgtu1'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.imgtu1'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.imgtu1'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},

  ]

  //UI
  @Builder

  xianzhiItems(data:Type1)
  {

    Column({space:0})
    {

      Text(data.title)
        .width('100%')
      Row({space:5})
      {

        Text(data.contents)
          .width('75%')
        Image(data.imgtu)
          .width(95)
          .height(80)
          .borderRadius(12)
      }.padding(5)
      .width('100%')
      Row()
      {
        Image(data.imgtouxiang)
          .width(30)
          .height(30)
          .borderRadius(20)
        Text(data.name)
        Column()
        {

        }
        //.width(120)
        Image(data.imgpin)
          .width(24).height(24)
        Text(data.pinlun+' ')

      }

      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }.width('100%')
    // .height('')
    // .margin({ top:10 })

    .padding(15)
  }
  build() {
    Column()
    {
      Column({space:10}){
        Row({space:8}){
          //占位
          Row(){}.width(5)
          Image($r('app.media.taoluntongzhi'))
            .width(25)
            .height(25)
          Text('请注意甄别消息真实性，谨防被骗')
            .fontSize(20)
        }
        .width('100%')
        .height(50)
        .justifyContent(FlexAlign.Start)


      }
      Scroll()
      {
        Column()
        {
          //列表
          //参数1：数组
          ForEach(this.datas,(item:Type1)=>{
            this.xianzhiItems(item)
          })
        }
      }


    }
  }
}

//求助
@Component
struct qiuzhu {
  //数据（模拟）
  datas:Type1[]=[
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶究竟应该怎么扔？',name:'OMINI.BASS',contents:'一杯奶茶有奶也有茶，应该怎么分类',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶究竟应该怎么扔？',name:'OMINI.BASS',contents:'一杯奶茶有奶也有茶，应该怎么分类',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶究竟应该怎么扔？',name:'OMINI.BASS',contents:'一杯奶茶有奶也有茶，应该怎么分类',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶究竟应该怎么扔？',name:'OMINI.BASS',contents:'一杯奶茶有奶也有茶，应该怎么分类',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶究竟应该怎么扔？',name:'OMINI.BASS',contents:'一杯奶茶有奶也有茶，应该怎么分类',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶究竟应该怎么扔？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶究竟应该怎么扔？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶究竟应该怎么扔？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶究竟应该怎么扔？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'奶茶究竟应该怎么扔？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},

  ]
  //UI
  @Builder
  qiuzhuItems(data:Type1)
  {
    Column({space:0})
    {

      Text(data.title)
        .width('100%')
      Row({space:5})
      {

        Text(data.contents)
          .width('75%')
        Image(data.imgtu)
          .width(95)
          .height(80)
          .borderRadius(12)
      }.padding(5)
      .width('100%')
      Row()
      {
        Image(data.imgtouxiang)
          .width(30)
          .height(30)
          .borderRadius(20)
        Text(data.name)
        Column()
        {

        }
        //.width(120)
        Image(data.imgpin)
          .width(24).height(24)
        Text(data.pinlun+' ')

      }

      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }.width('100%')
    // .height('')
    // .margin({ top:10 })

    .padding(15)
  }
  build() {
    Column()
    {

      Scroll()
      {
        Column()
        {
          //列表
          //参数1：数组
          ForEach(this.datas,(item:Type1)=>{
            this.qiuzhuItems(item)
          })
        }
      }


    }
  }
}



//吐槽
@Component
struct tucao {
  //数据（模拟）
  datas:Type1[]=[
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'听说OMINI又要搞事了？',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},

  ]
  //UI
  @Builder
  tucaoItems(data:Type1)
  {
    Column({space:0})
    {

      Text(data.title)
        .width('100%')
      Row({space:5})
      {

        Text(data.contents)
          .width('75%')
        Image(data.imgtu)
          .width(95)
          .height(80)
          .borderRadius(12)
      }.padding(5)
      .width('100%')
      Row()
      {
        Image(data.imgtouxiang)
          .width(30)
          .height(30)
          .borderRadius(20)
        Text(data.name)
        Column()
        {

        }
        //.width(120)
        Image(data.imgpin)
          .width(24).height(24)
        Text(data.pinlun+' ')

      }

      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }.width('100%')
    // .height('')
    // .margin({ top:10 })

    .padding(15)
  }
  build() {
    Column()
    {

      Scroll()
      {
        Column()
        {
          //列表
          //参数1：数组
          ForEach(this.datas,(item:Type1)=>{
            this.tucaoItems(item)
          })
        }
      }


    }
  }
}

//社区
@Component
struct shequ{
  //数据（模拟）
  datas:Type1[]=[

    {imgtu:$r('app.media.imgtu4'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'希望OMINI社区多出新活动啊',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.imgtu4'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'希望OMINI社区多出新活动啊',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.imgtu4'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'希望OMINI社区多出新活动啊',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.imgtu4'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},
    {imgtu:$r('app.media.tu'),imgtouxiang:$r('app.media.touxiang'),imgpin:$r('app.media.pinlun'),title:'闲置玻璃杯换OMINI币',name:'OMINI.BASS',contents:'原型更新更新速度慢，挖个坑填半年，再这样就取关了！',pinlun:25684},

  ]

  //UI
  @Builder

  shequItems(data:Type1)
  {

    Column({space:0})
    {

      Text(data.title)
        .width('100%')
      Row({space:5})
      {

        Text(data.contents)
          .width('75%')
        Image(data.imgtu)
          .width(95)
          .height(80)
          .borderRadius(12)
      }.padding(5)
      .width('100%')
      Row()
      {
        Image(data.imgtouxiang)
          .width(30)
          .height(30)
          .borderRadius(20)
        Text(data.name)
        Column()
        {

        }
        //.width(120)
        Image(data.imgpin)
          .width(24).height(24)
        Text(data.pinlun+' ')

      }

      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }.width('100%')
    // .height('')
    // .margin({ top:10 })

    .padding(15)
  }
  build() {
    Column()
    {
      Column({space:10}){
        Row({space:8}){
          //占位
          Row(){}.width(5)
          Image($r('app.media.taoluntongzhi'))
            .width(25)
            .height(25)
          Text('请按照规范进行发帖，注意言行举止')
            .fontSize(20)
        }
        .width('100%')
        .height(50)
        .justifyContent(FlexAlign.Start)


      }
      Column({space:10}){
        Row({space:8}){
          //占位
          Row(){}.width(5)
          Image($r('app.media.taoluntongzhi'))
            .width(25)
            .height(25)
          Text('OMINI社区总规则')
            .fontSize(20)
        }
        .width('100%')
        .height(50)
        .justifyContent(FlexAlign.Start)


      }
      Scroll()
      {
        Column()
        {
          //列表
          //参数1：数组
          ForEach(this.datas,(item:Type1)=>{
            this.shequItems(item)
          })
        }
      }


    }
  }
}


//
interface Type1{
  imgtu:Resource
  imgtouxiang:Resource
  imgpin:Resource
  title:string
  name:string
  contents:string
  pinlun:number
}


interface Type2{
  imgtu1:Resource
  imgtu2:Resource
  imgtu3:Resource
  imgtouxiang:Resource
  title:string
  name:string
  imgpin:Resource
  pinlun:number
}