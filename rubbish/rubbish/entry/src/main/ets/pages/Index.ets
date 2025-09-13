import { DaoHangPage } from './DaoHangPage'
import  {store}  from './store'
import  {ScanPage}  from './ScanPage'
import  {Wode}  from './Wode'
import { Home } from './Home'
@Entry
@Component
/*
struct Index {
  @State message: string = 'Hello World';
  // 定义一个变量表示当前选项卡的下标
  @State currentIndex: number = 0

  // 自定义builder
  @Builder
  myTabsBar(img:Resource,title:string,index:number){
    Column({space:5}){
      if(index == 2){
        Image(img)
          .width(30).height(30)
      } else{
        Image(img)
          .fillColor(this.currentIndex == index ? '#000000':'#9E9E9E')
          .width(24).height(24)
        Text(title)
          .fontColor(this.currentIndex == index ? '#F68C95':'#999999')
          .fontSize(12)
      }
    }
  }
  private getActiveIcon(index: number): Resource {
    switch (index) {
      case 0: // 首页
        return $r('app.media.homebutton');
      case 1: // 导航
        return $r('app.media.daohang');
      case 3: // 商店
        return $r('app.media.blackshop');
      case 4: // 我的
        return $r('app.media.blackmy');
      default:
        return $r('app.media.blackmy');
    }
  }


  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        // 首页 Tab
        TabContent() {
          Home()
        }.tabBar(
          this.myTabsBar(
            this.currentIndex == 0 ? $r('app.media.homebutton') : $r('app.media.whitehomebutton'), // 黑或白图
            '首页',
            0
          )
        )

        // }.tabBar(this.myTabsBar($r('app.media.whitehomebutton'), '首页', 0))

        // 导航 Tab
        TabContent() {
          DaoHangPage() // 使用组件标签语法
        }.tabBar(this.myTabsBar($r('app.media.daohang'), '导航', 1))
        // }.tabBar(this.myTabsBar($r('app.media.whitesaomiao'), '导航', 1))

        // 添加 Tab
        TabContent() {
          ScanPage()
        }.tabBar(this.myTabsBar($r('app.media.saomiao'), '扫描', 2))

        // 商店 Tab
        TabContent() {
          store()
        // }.tabBar(this.myTabsBar($r('app.media.shop'), '商店', 3))
        }.tabBar(this.myTabsBar($r('app.media.blackshop'), '商店', 3))

        // 我的 Tab
        TabContent() {
          Wode()
        // }.tabBar(this.myTabsBar($r('app.media.my'), '我的', 4))
        }.tabBar(this.myTabsBar($r('app.media.blackmy'), '我的', 4))
      }
      .onChange((index: number) => {
        this.currentIndex = index
        console.log('当前选项卡下标:', index)
      })
    }
    .height('100%')
    .width('100%')
  }
}
*/

struct Index {
  @State message: string = 'Hello World';
  @State currentIndex: number = 0

  // 自定义builder
  @Builder
  myTabsBar(img: Resource, title: string, index: number) {
    Column({ space: 5 }) {
      if (index === 2) {
        // 扫描按钮特殊处理
        Image(img)
          .width(30)
          .height(30)
      } else {
        // 其他按钮 - 使用 getIconResource 方法获取正确的图标资源
        Image(this.getIconResource(index))
          .width(24)
          .height(24)
        Text(title)
          .fontColor(this.currentIndex === index ? '#F68C95' : '#999999')
          .fontSize(12)
      }
    }
  }

  // 获取图标资源 - 确保所有路径都有返回值
  private getIconResource(index: number): Resource {
    // 如果当前标签被选中，返回深色图标，否则返回浅色图标
    if (this.currentIndex === index) {
      // 返回深色图标
      switch (index) {
        case 0: // 首页
          return $r('app.media.homebutton');
        case 1: // 导航
          return $r('app.media.daohang');
        case 3: // 商店
          return $r('app.media.blackshop');
        case 4: // 我的
          return $r('app.media.blackmy');
        default:
          return $r('app.media.blackmy'); // 默认深色图标
      }
    } else {
      // 返回浅色图标
      switch (index) {
        case 0: // 首页
          return $r('app.media.whitehomebutton');
        case 1: // 导航
          return $r('app.media.whiteplan');
        case 3: // 商店
          return $r('app.media.shop');
        case 4: // 我的
          return $r('app.media.my');
        default:
          return $r('app.media.my'); // 默认浅色图标
      }
    }
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        // 首页 Tab
        TabContent() {
          Home()
        }.tabBar(this.myTabsBar($r('app.media.homebutton'), '首页', 0))

        // 导航 Tab
        TabContent() {
          DaoHangPage()
        }.tabBar(this.myTabsBar($r('app.media.daohang'), '导航', 1))

        // 添加 Tab
        TabContent() {
          ScanPage()
        }.tabBar(this.myTabsBar($r('app.media.saomiao'), '扫描', 2))

        // 商店 Tab
        TabContent() {
          store()
        }.tabBar(this.myTabsBar($r('app.media.shop'), '商店', 3))

        // 我的 Tab
        TabContent() {
          Wode()
        }.tabBar(this.myTabsBar($r('app.media.my'), '我的', 4))
      }
      .onChange((index: number) => {
        this.currentIndex = index
        console.log('当前选项卡下标:', index)
      })
    }
    .height('100%')
    .width('100%')
  }
}