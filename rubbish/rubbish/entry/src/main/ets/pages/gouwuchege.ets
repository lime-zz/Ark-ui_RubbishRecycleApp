import router from "@ohos.router"

interface Type1 {
  img: Resource;
  contents:string;
  dvalue: string;
  cvalue: string;
  amount:string;
  avalue:string;
  img1:Resource;
  selected: boolean;
}

@Entry
@Component
struct Gouwuche {
  @State message: string = 'Hello World';
  @State isSelectedAll: boolean = false;
  @State datas: Type1[] = [
    {img:$r('app.media.shop1'),contents:'商品1',dvalue:'250币',cvalue:'200币',amount:'X2',avalue:'400币',img1:$r('app.media.shop1'),selected:false},
    {img:$r('app.media.shop1'),contents:'商品2',dvalue:'250币',cvalue:'200币',amount:'X2',avalue:'400币',img1:$r('app.media.shop1'),selected:false},
    {img:$r('app.media.shop1'),contents:'商品3',dvalue:'250币',cvalue:'200币',amount:'X2',avalue:'400币',img1:$r('app.media.shop1'),selected:false},
  ]

  updateSelection() {
    this.isSelectedAll = this.datas.every(item => item.selected);
  }

  toggleSelection(index: number) {
    const newDatas: Type1[] = this.datas.map((item, i) => {
      return {
        img: item.img,
        contents: item.contents,
        dvalue: item.dvalue,
        cvalue: item.cvalue,
        amount: item.amount,
        avalue: item.avalue,
        img1: item.img1,
        selected: (i === index) ? !item.selected : item.selected
      }as Type1;
    });

    this.datas = newDatas;
    this.updateSelection();
  }

  // ✅ 这里是我们唯一需要修改的地方
  toggleSelectAll() {
    const newSelectedState = !this.isSelectedAll;

    const newDatas: Type1[] = this.datas.map((item: Type1): Type1 => {
      return {
        img: item.img,
        contents: item.contents,
        dvalue: item.dvalue,
        cvalue: item.cvalue,
        amount: item.amount,
        avalue: item.avalue,
        img1: item.img1,
        selected: newSelectedState
      }as Type1;
    })

    this.datas = newDatas;
    this.isSelectedAll = newSelectedState;
  }

  @Builder
  hotItems(item: Type1, index: number) {
    Row({ space: 5 }) {
      Checkbox()
        .select(item.selected)
        .onChange((checked: boolean) => {
          item.selected = checked;
          this.toggleSelection(index);
        })
      Image(item.img).width(100).height(100).borderRadius(12).margin({top:10,bottom:10,left:10})
      Column({ space: 5 }) {
        Text(item.contents).fontSize(14).fontColor('#000000')
        Row() {
          Text(item.dvalue).fontSize(14).fontColor('#E0E0E0')
            .decoration({ type: TextDecorationType.LineThrough })
            .margin({left:90,right:10})
          Text(item.cvalue).fontSize(14).fontColor('#000000').margin({right:10})
        }.justifyContent(FlexAlign.End);
        Text(item.amount).fontSize(14).fontColor('#000000').textAlign(TextAlign.End).margin({left:110,right:10})
        Row() {
          Text(item.avalue).fontSize(18).fontColor('#FF5E81').margin({left:90,right:10})
          Image(item.img1).width(15).height(15).margin({right:10})
        }.justifyContent(FlexAlign.End)
      }
    }
    .width('90%')
    .backgroundColor('#FFFFFF')
    .borderRadius(12)
    .margin(10)
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.shop1')).width(24).height(24).zIndex(1).margin({ right: 10 })
          .onClick(() => router.back())
        Text('购物车').fontSize(30).fontWeight(600).fontColor($r('sys.color.white'))
      }
      .padding({ top: 15, right: 10, bottom: 20, left: 10 })
      .width('100%')
      .justifyContent(FlexAlign.Start);

      Scroll(){
        Column(){
          ForEach(this.datas, (item: Type1, index: number) => {
            this.hotItems(item, index)
          })

          Row({}) {
            Row({ space: 10 }) {
              Checkbox()
                .select(this.isSelectedAll)
                .onChange(() => this.toggleSelectAll())
              Button(`${this.isSelectedAll ? '取消全选' : '全选'}`)
                .width('40%').height(150)
                .fontSize(20).fontColor('#000000').fontWeight(300)
                .backgroundColor('#FFFFFF')
                .onClick(() => this.toggleSelectAll())
            }
            .backgroundColor('#FFFFFF')
            .margin({ top: 60, bottom: 60 })

            Column() {
              Button('立即结算')
                .width('50%').height(150)
                .backgroundColor('#00C9D6')
                .fontColor('#FFFFFF')
                .fontWeight(300)
                .fontSize(20)
                .onClick(() => console.log('结算按钮被点击'))
            }
            .backgroundColor('#00C9D6')
            .margin({top:60,bottom:60})
          }
          .zIndex(1)
          .width('100%')
          .justifyContent(FlexAlign.Center);
        }
      }
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#EBFCF9')
    .backgroundImage($r('app.media.shop1'))
    .backgroundImageSize({ width: '100%', height: '25%' })
  }
}
