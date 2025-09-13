import { DialogHelper } from '@pura/harmony-dialog';
import { SymbolGlyphModifier } from '@kit.ArkUI' // 导入 SymbolGlyphModifier 类，用于定义符号图标样式
import { promptAction } from "@kit.ArkUI";

@Entry
@Component
struct Tixian {
  @State message: string = 'Hello World';
@State isShow:boolean=false;
@Builder
mySheet()
{
  Column() { // 创建一个垂直排列的 Column 容器
    Select([ // 创建一个 Select 组件，用于展示多个选项
      {
        value: 'Afra55', // 选项的值
        icon: $r('app.media.startIcon') // 选项的图标，使用资源文件中的图片
      },
      {
        value: 'Afra66', // 选项的值
        icon: $r('app.media.startIcon') // 选项的图标，使用资源文件中的图片
      },
      {
        value: 'Afra77', // 选项的值
        icon: $r('app.media.startIcon') // 选项的图标，使用资源文件中的图片
      },
      {
        value: 'Afra88', // 选项的值
        icon: $r('app.media.startIcon') // 选项的图标，使用资源文件中的图片
      },
      {
        value: 'Afra99', // 选项的值
        icon: $r('app.media.startIcon'), // 选项的图标，使用资源文件中的图片
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.exposure')).fontColor([Color.Gray]) // 使用 SymbolGlyphModifier 设置符号图标，并指定颜色为灰色
      }
    ])
      .selected(3) // 设置默认选中的选项索引为 3
      .value("     ") // 设置 Select 组件的初始显示值为 "Afra55大全"
      .font({ size: 20, weight: 500 }) // 设置 Select 组件的字体大小和粗细
      .fontColor(Color.Orange) // 设置 Select 组件的字体颜色为橙色
      .selectedOptionFont({ size: 50, weight: 1000 }) // 设置选中选项的字体大小和粗细
      .optionFont({ size: 16, weight: 300 }) // 设置非选中选项的字体大小和粗细
  }
  .width('100%') // 设置 Column 容器的宽度为 100%
}
  build() {

Column()
{
  Row({space:6})
  {
    Image($r('app.media.fanhui'))
      .width(20)
      .height(20)
    Text('提现')
      .fontColor('#ffffff')
      .fontSize('25')
      .fontWeight('600')

  }
  .width('100%')
  .height('10%')
  .backgroundColor('#2BCDDD')
//我的资产
  Column()
  {
    Row()
    {
      Row()
      {
        Text('|  ')
          .fontColor('#FF5E81')
          .fontWeight(800)
          .fontSize(20)
        Text('我的资产')
          .fontSize(20)
          .fontWeight(800)
      }.padding({ left:7,top:7 })
      .width('100%')
    }
  Image($r('app.media.wodezichan'))
    .height(120)
    .width(120)
    Text('5000.00币')
      .fontSize(30)
      .fontColor('#FF5E81')
    Text('今日兑率  10币：1人民币')
      .fontColor('#999999')
      .width('100%')  // 必须设置宽度
      .height(50)  // 必须设置高度
      .textAlign(TextAlign.Center)  // 关键属性：文字居中


  }
  .width('95%')
  .backgroundColor('#ffffff')
  .height('29%')
  .margin({top:10,bottom:15})
  .borderRadius(10)
  //提现申请
Column()
{
  Row()
  {
    Text(' |  ')
      .fontColor('#FF5E81')
      .fontWeight(800)
      .fontSize(20)
    Text('提现申请')
      .fontSize(20)
      .fontWeight(800)
  }
  .width('100%')

  Row()
  {
    Text('提现金额：')
      .fontSize(15)
      .fontWeight(600)
    TextInput({placeholder:'请输入提现金额'})
      .backgroundColor('#ffffff')
      .width('80%')
  }
  .width('100%')
  .padding({left:7})
  Row()
  {
    Text('到账时间：')
      .fontSize(15)
      .fontWeight(600)
    TextInput({placeholder:'请选择到账时间'})
      .backgroundColor('#ffffff')
      .width('80%')

  }
  .width('100%')
  .padding({left:7})
  Text('前资产余额低于100币不可提现，提现手续费按照到账  周期收取，每天限3次')
    .fontColor('#999999')
    .fontSize(14)
    .padding({left:7})
  Row()
  {

  }
  .layoutWeight(1)
}
.width('95%')
  .height('40%')
.backgroundColor('#ffffff')
.borderRadius(10)
  Row()

  Button('提现')
    .width('95%')
    .height('5%')
    .margin({top:80,bottom:10})
    .backgroundColor('#5AEAD7')
    .onClick(() => {
      promptAction.showToast({ message: '提现成功' })
    })

}
.height('100%')
    .width('100%')
    .backgroundColor('#ECFDFA')
.bindSheet($$this.isShow,this.mySheet(),{height:SheetSize.FIT_CONTENT})
  }
}