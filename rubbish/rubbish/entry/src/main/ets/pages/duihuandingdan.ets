import { router } from '@kit.ArkUI';

@Entry
@Component
//兑换订单
export struct Duihuandingdan {
  //Swiper控制器
  swiperController:SwiperController = new SwiperController();
  //定义变量记录当前Swiper的下标
  @State currentIndex:number = 0;
  build() {
    Column(){
      Column({space:13}) {
        //标题
        Column() {
          Text('< 兑换订单')
            .width('100%')
            .fontSize(20)
            .fontWeight(FontWeight.Bolder)
            .fontColor('#ffffff')
        }
        .margin({top:35})
        Row() {
          Text('待支付')
            .fontColor('#ffffff')
            .fontWeight(this.currentIndex == 0 ? FontWeight.Bolder: FontWeight.Regular)
            .fontSize(this.currentIndex == 0 ? '19' : '15')
            .onClick(() => {
              this.currentIndex = 0
              this.swiperController.changeIndex(0)
            })
          Text('待取货')
            .fontColor('#ffffff')
            .fontWeight(this.currentIndex == 1 ? FontWeight.Bolder: FontWeight.Regular)
            .fontSize(this.currentIndex == 1 ? '19' : '15')
            .onClick(() => {
              this.currentIndex = 1
              this.swiperController.changeIndex(1)
            })
          Text('配送中')
            .fontColor('#ffffff')
            .fontWeight(this.currentIndex == 2 ? FontWeight.Bolder: FontWeight.Regular)
            .fontSize(this.currentIndex == 2 ? '19' : '15')
            .onClick(() => {
              this.currentIndex = 2
              this.swiperController.changeIndex(2)
            })
          Text('已完成')
            .fontColor('#ffffff')
            .fontWeight(this.currentIndex == 3 ? FontWeight.Bolder: FontWeight.Regular)
            .fontSize(this.currentIndex == 3 ? '19' : '15')
            .onClick(() => {
              this.currentIndex = 3
              this.swiperController.changeIndex(3)
            })
        }
        .padding(15)
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .padding(15)
      .backgroundColor('#2bcddd')
      .height('16%')
      //待支付、待取货、、、
      Swiper(this.swiperController){
        daizhifu()
        daiquhuo()
        peisongzhong()
        yiwancheng()
      }
      .onChange(index=>{
        this.currentIndex = index
      })
      .indicator(false)//去掉导航点
      .width('100%')
    }
  }
}

// 待支付
interface  Type2{
  biaoti:string
  bianhao:number
  shangping:Resource
  jine:number
}

@Component
struct daizhifu {

  //1、模拟数据
  datas:Type2[] = [
    {
      bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套  欧式高档卫生间洗漱用品',jine:88
    },
    {
      bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套 欧式高档卫生间洗漱用品',jine:88
    },{
    bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套 欧式高档卫生间洗漱用品',jine:88
  },{
    bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套欧式高档卫生间洗漱用品',jine:88
  }]

  //2、UI
  @Builder
  itemUI(item:Type2){
    Column({space:10}){
      Row({space:10}){
        Row(){
        Image($r("app.media.shu"))
          .width(15)
        Text(' 订单详情')
          .fontWeight(FontWeight.Bolder)
          .fontSize(18)
        }
        Text('订单编号：'+item.bianhao)
          .fontSize(14)
          .fontColor('#999999')
      }
      .padding(15)
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row({space:10}){
        Image(item.shangping)
          .width(80)
          .height(80)
          .borderRadius(15)
        Column(){
        Text(item.biaoti)
          .fontSize(14)
          .fontColor('#40464c')

          Text(item.jine +'币')
            .fontSize(16)
            .width('15%')
            .fontColor('#ff5e81')
            .margin({left:230})
        }
        .width('80%')
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('98%')

      Row({space:10}){
        Button('取消订单', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(12)
          .width(85)
          .height(28)
          .fontWeight(FontWeight.Bolder)
          .backgroundColor('#ff5e81')
          .borderRadius(30)

        Button('立即支付', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(12)
          .width(85)
          .height(28)
          .fontWeight(FontWeight.Bolder)
          .backgroundColor('#ff5e81')
          .borderRadius(30)
          .onClick(() => router.pushUrl({ url: 'pages/zhifu' }));
      }
      .margin({left:150})
      .backgroundColor('#f9f9f9')
      .backgroundImageSize(ImageSize.Cover)
    }
    .backgroundColor('#fffff')
    .padding(15)
  }

  //定义变量表示是否正在下拉刷新
  @State isRefresh:boolean = false;

  //定义变量表示是否正在上拉加载
  @State isLoading:boolean = false;
  build() {
    Column(){
      //列表展示   List
      Refresh({refreshing:$$this.isRefresh,promptText:'正在加载中...'}){
        List(){
          ForEach(this.datas,(item:Type2)=>{
            ListItem(){
              this.itemUI(item)
            }
          })
          if(this.isLoading){
            ListItem(){
              Row({space:5}){
                Text('拼命加载中...')
                LoadingProgress().width(20)
                  .height(20)
              }
              .justifyContent(FlexAlign.Center)
              .padding(20)
              .width('100%')
            }
          }
        }
        .onScrollIndex((start:number,end:number)=>{
          if(end == this.datas.length - 1  && !this.isLoading){
            this.isLoading = true
            setTimeout(()=>{
              this.isLoading = false;
            },3000)
          }
        })
        .scrollBar(BarState.Off)
      }
      .onRefreshing(()=>{  //当刷新的时候会自动调用此函数
        //模拟获取新数据
        setTimeout(()=>{
          this.isRefresh = false;
        },2000)
      })

    }
  }
}

//待取货
interface  Type3{
  biaoti:string
  mendian:string
  bianhao:number
  shangping:Resource
  jine:number
  quhuoma:number
}

@Component
struct daiquhuo {
  datas:Type3[] = [
    {
      bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套  欧式高档卫生间洗漱用品',jine:88,quhuoma:123456,mendian:'OMINI来福店'
    },
    {
      bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套 欧式高档卫生间洗漱用品',jine:88,quhuoma:123456,mendian:'OMINI来福店'
    },{
    bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套 欧式高档卫生间洗漱用品',jine:88,quhuoma:123456,mendian:'OMINI来福店'
  },{
    bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套欧式高档卫生间洗漱用品',jine:88,quhuoma:123456,mendian:'OMINI来福店'
  }]

  //2、UI
  @Builder
  itemUI(item:Type3){
    Column({space:10}){
      Row({space:10}){
        Row(){
          Image($r("app.media.shu"))
            .width(15)
          Text(' 订单详情')
            .fontWeight(FontWeight.Bolder)
            .fontSize(18)
        }
        Text('订单编号：'+item.bianhao)
          .fontSize(14)
          .fontColor('#999999')
      }
      .padding(15)
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row({space:10}){
        Image(item.shangping)
          .width(80)
          .height(80)
          .borderRadius(15)
        Column(){
          Text(item.biaoti)
            .fontSize(14)
            .fontColor('#40464c')

          Text(item.jine +'币')
            .fontSize(16)
            .width('15%')
            .fontColor('#ff5e81')
            .margin({left:230})
          Text('预计送达时间：'+item.mendian)
            .fontSize(12)
            .fontColor('#999999')
            .margin({left:100})
        }
        .width('80%')
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('98%')

      Row({space:10}){
        Text('取货码：'+item.quhuoma)
          .fontSize(14)
          .fontColor('#999999')

        Button('二维码', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(12)
          .width(85)
          .height(28)
          .fontWeight(FontWeight.Bolder)
          .backgroundColor('#ff5e81')
          .borderRadius(30)
      }
      .width('90%')
      .backgroundImageSize(ImageSize.Cover)
      .justifyContent(FlexAlign.SpaceBetween)

    }
    .backgroundColor('#fffff')
    .padding(15)
  }

  //定义变量表示是否正在下拉刷新
  @State isRefresh:boolean = false;

  //定义变量表示是否正在上拉加载
  @State isLoading:boolean = false;
  build() {
    Column(){
      //列表展示   List
      Refresh({refreshing:$$this.isRefresh,promptText:'正在加载中...'}){
        List(){
          ForEach(this.datas,(item:Type3)=>{
            ListItem(){
              this.itemUI(item)
            }
          })
          if(this.isLoading){
            ListItem(){
              Row({space:5}){
                Text('拼命加载中...')
                LoadingProgress().width(20)
                  .height(20)
              }
              .justifyContent(FlexAlign.Center)
              .padding(20)
              .width('100%')
            }
          }
        }
        .onScrollIndex((start:number,end:number)=>{
          if(end == this.datas.length - 1  && !this.isLoading){
            this.isLoading = true
            setTimeout(()=>{
              this.isLoading = false;
            },3000)
          }
        })
        .scrollBar(BarState.Off)
      }
      .onRefreshing(()=>{  //当刷新的时候会自动调用此函数
        //模拟获取新数据
        setTimeout(()=>{
          this.isRefresh = false;
        },2000)
      })

    }
  }
}

//配送中
interface  Type4{
  biaoti:string
  bianhao:number
  shangping:Resource
  jine:number
  shijian:number
}
@Component
struct peisongzhong {
  //数据(模拟数据)
  datas:Type4[] = [
    {
      bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套  欧式高档卫生间洗漱用品',jine:88,shijian:20250418
    },
    {
      bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套 欧式高档卫生间洗漱用品',jine:88,shijian:20250113
    },{
    bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套 欧式高档卫生间洗漱用品',jine:88,shijian:20250418
  },{
    bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套欧式高档卫生间洗漱用品',jine:88,shijian:20250113
  }]

  //2、UI
  @Builder
  itemUI(item:Type4){
    Column({space:10}){
      Row({space:10}){
        Row(){
          Image($r("app.media.shu"))
            .width(15)
          Text(' 订单详情')
            .fontWeight(FontWeight.Bolder)
            .fontSize(18)
        }
        Text('订单编号：'+item.bianhao)
          .fontSize(14)
          .fontColor('#999999')
      }
      .padding(15)
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row({space:10}){
        Image(item.shangping)
          .width(80)
          .height(80)
          .borderRadius(15)
        Column(){
          Text(item.biaoti)
            .fontSize(14)
            .fontColor('#40464c')
          Text(item.jine +'币')
            .fontSize(16)
            .width('15%')
            .fontColor('#ff5e81')
            .margin({left:230})
          Text('预计送达时间：'+item.shijian)
            .fontSize(14)
            .fontColor('#999999')
            .margin({left:90})
        }
        .width('80%')
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('98%')

      Row({space:10}){


        Button('配送详情', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(12)
          .fontWeight(FontWeight.Bolder)
          .width(85)
          .height(28)
          .backgroundColor('#ff5e81')
          .borderRadius(30)
      }
      .margin({left:250})
      .backgroundImageSize(ImageSize.Cover)
      .justifyContent(FlexAlign.SpaceBetween)

    }
    .backgroundColor('#fffff')
    .padding(15)
  }

  //定义变量表示是否正在下拉刷新
  @State isRefresh:boolean = false;

  //定义变量表示是否正在上拉加载
  @State isLoading:boolean = false;
  build() {
    Column(){
      //列表展示   List
      Refresh({refreshing:$$this.isRefresh,promptText:'正在加载中...'}){
        List(){
          ForEach(this.datas,(item:Type4)=>{
            ListItem(){
              this.itemUI(item)
            }
          })
          if(this.isLoading){
            ListItem(){
              Row({space:5}){
                Text('拼命加载中...')
                LoadingProgress().width(20)
                  .height(20)
              }
              .justifyContent(FlexAlign.Center)
              .padding(20)
              .width('100%')
            }
          }
        }
        .onScrollIndex((start:number,end:number)=>{
          if(end == this.datas.length - 1  && !this.isLoading){
            this.isLoading = true
            setTimeout(()=>{
              this.isLoading = false;
            },3000)
          }
        })
        .scrollBar(BarState.Off)
      }
      .onRefreshing(()=>{  //当刷新的时候会自动调用此函数
        //模拟获取新数据
        setTimeout(()=>{
          this.isRefresh = false;
        },2000)
      })

    }
  }
}

// 已完成

interface  Type5{
  biaoti:string
  bianhao:number
  shangping:Resource
  jine:number
  shijian:number
}
@Component
struct yiwancheng {
  //数据(模拟数据)
  datas:Type5[] = [
    {
      bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套  欧式高档卫生间洗漱用品',jine:88,shijian:20250418
    },
    {
      bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套 欧式高档卫生间洗漱用品',jine:88,shijian:20250113
    },{
    bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套 欧式高档卫生间洗漱用品',jine:88,shijian:20250418
  },{
    bianhao:6458888888,shangping:$r('app.media.shangping'),biaoti:'创意卫浴五件套欧式高档卫生间洗漱用品',jine:88,shijian:20250113
  }]

  //2、UI
  @Builder
  itemUI(item:Type5){
    Column({space:10}){
      Row({space:10}){
        Row(){
          Image($r("app.media.shu"))
            .width(15)
          Text(' 订单详情')
            .fontWeight(FontWeight.Bolder)
            .fontSize(18)
        }
        Text('订单编号：'+item.bianhao)
          .fontSize(14)
          .fontColor('#999999')
      }
      .padding(15)
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row({space:10}){
        Image(item.shangping)
          .width(80)
          .height(80)
          .borderRadius(15)
        Column(){
          Text(item.biaoti)
            .fontSize(14)
            .fontColor('#40464c')
          Text(item.jine +'币')
            .fontSize(16)
            .width('15%')
            .fontColor('#ff5e81')
            .margin({left:230})
          Text('订单完成时间：'+item.shijian)
            .fontSize(14)
            .fontColor('#999999')
            .margin({left:90})
        }
        .width('80%')
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('98%')

      Row({space:10}){


        Button('再来一单', { type: ButtonType.Normal, stateEffect: true })
          .fontSize(12)
          .fontWeight(FontWeight.Bolder)
          .width(85)
          .height(28)
          .backgroundColor('#ff5e81')
          .borderRadius(30)
      }
      .margin({left:250})
      .backgroundImageSize(ImageSize.Cover)
      .justifyContent(FlexAlign.SpaceBetween)

    }
    .backgroundColor('#fffff')
    .padding(15)
  }

  //定义变量表示是否正在下拉刷新
  @State isRefresh:boolean = false;

  //定义变量表示是否正在上拉加载
  @State isLoading:boolean = false;
  build() {
    Column(){
      //列表展示   List
      Refresh({refreshing:$$this.isRefresh,promptText:'正在加载中...'}){
        List(){
          ForEach(this.datas,(item:Type5)=>{
            ListItem(){
              this.itemUI(item)
            }
          })
          if(this.isLoading){
            ListItem(){
              Row({space:5}){
                Text('拼命加载中...')
                LoadingProgress().width(20)
                  .height(20)
              }
              .justifyContent(FlexAlign.Center)
              .padding(20)
              .width('100%')
            }
          }
        }
        .onScrollIndex((start:number,end:number)=>{
          if(end == this.datas.length - 1  && !this.isLoading){
            this.isLoading = true
            setTimeout(()=>{
              this.isLoading = false;
            },3000)
          }
        })
        .scrollBar(BarState.Off)
      }
      .onRefreshing(()=>{  //当刷新的时候会自动调用此函数
        //模拟获取新数据
        setTimeout(()=>{
          this.isRefresh = false;
        },2000)
      })
    }
  }
}