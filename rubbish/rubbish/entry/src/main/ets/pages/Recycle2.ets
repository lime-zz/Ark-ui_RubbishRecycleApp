import router from '@ohos.router';
import prompt from '@ohos.prompt';


// 订单数据模型（整合了不同状态的字段）
interface OrderItem {
  shopName: string;   // 店铺名称
  distance?: string;  // 距离（已接单状态使用）
  staffName?: string; // 收货员姓名（已接单状态使用）
  staffPhone?: string; // 收货员电话（已接单状态使用）
  waitTime: string;   // 等待时长
  status: string;     // 订单状态（待接单/已接单/回收中/已完成）
  address?: string;   // 地址（待接单状态使用）
  time?: string;      // 订单时间（待接单状态使用）
}

@Entry
@Component
struct RecycleOrderPage {
  // 模拟订单数据（整合不同状态）
  @State orderList: OrderItem[] = [
  // 待接单订单
    {
      shopName: 'OMINI来福士广场店',
      status: '待接单',
      waitTime: '00:12:43',
      address: '上海市浦东新区世纪大道1192号来福士广场1层32号',
      time: '2025-07-16 11:14:15'
    },
    {
      shopName: 'OMINI环球港店',
      status: '待接单',
      waitTime: '00:25:16',
      address: '上海市普陀区中山北路3300号环球港4层56号',
      time: '2025-07-16 10:30:45'
    },
    // 已接单订单
    {
      shopName: 'OMINI静安寺店',
      distance: '2.5 公里',
      staffName: '赵师傅',
      staffPhone: '13255698856',
      waitTime: '00:12:58',
      status: '已接单',
      address: '上海市静安区南京西路1618号久光百货B1层15号'
    },
    {
      shopName: 'OMINI陆家嘴店',
      distance: '1.8 公里',
      staffName: '王师傅',
      staffPhone: '13988776655',
      waitTime: '00:05:32',
      status: '已接单',
      address: '上海市浦东新区陆家嘴环路1318号'
    },
    // 回收中订单（可扩展）
    {
      shopName: 'OMINI五角场店',
      distance: '3.2 公里',
      staffName: '李师傅',
      staffPhone: '13677889900',
      waitTime: '00:45:12',
      status: '回收中',
      address: '上海市杨浦区邯郸路600号万达广场2层23号'
    },
    // 已完成订单（可扩展）
    {
      shopName: 'OMINI徐家汇店',
      distance: '4.7 公里',
      staffName: '张师傅',
      staffPhone: '13566778899',
      waitTime: '01:23:45',
      status: '已完成',
      address: '上海市徐汇区虹桥路1号港汇恒隆广场3层45号'
    }
  ];

  // 当前选中的选项卡状态
  @State selectedTab: string = '待接单';
  // 下拉刷新状态
  @State isRefreshing: boolean = false;
  // 上拉加载状态
  @State isLoading: boolean = false;
  // 分页索引
  @State pageIndex: number = 1;

  build() {
    Column() {
      // 1. 顶部标题栏
      Stack({ alignContent: Alignment.Start }) {
        Column() {}.width('100%').height('100%').backgroundColor('#2BCDDC');

        Row() {
          Image($r('app.media.return'))
            .width(20)
            .height(20)
          Text('回收订单')
            .fontSize(20)
            .fontColor('#ffffff')
            .margin({ left: 10 })
            .fontWeight(FontWeight.Bold);
        }
      }.width('100%').height(50)
       .margin({top:20})
      .backgroundColor('#2BCDDC');

      // 2. 选项卡导航栏
      Row() {
        this.buildTab('待接单', '待接单');
        this.buildTab('已接单', '已接单');
        this.buildTab('回收中', '回收中');
        this.buildTab('已完成', '已完成');
      }
      .width('100%')
      .height(45)
      .backgroundColor('#2BCDDC');

      // 3. 分隔线
      Column() {}.width('100%').height(1).backgroundColor('#ECECEC');

      // 4. 下拉刷新 + 列表区域
      Refresh({
        refreshing: this.isRefreshing,promptText:'加载中'
      }) {
        List({ space: 15 }) {
          // 筛选当前选项卡对应的订单
          ForEach(
            this.orderList.filter(item => item.status === this.selectedTab),
            (item: OrderItem) => {
              ListItem() {
                this.buildOrderItem(item);
              }
            },
            (item: OrderItem) => item.shopName + (item.staffPhone || item.time)
          );

          // 上拉加载更多占位
          if (this.isLoading) {
            ListItem() {
              Row() {
                Text('加载中...')
                  .fontSize(14)
                  .fontColor('#999999')
                  .margin({ left: 10 });
              }
              .width('100%')
              .height(60)
              .justifyContent(FlexAlign.Center);
            }
          }
        }
        .width('100%')
        .backgroundColor('#F8F8F8')
        .scrollBar(BarState.Off)
        .onReachEnd(() => {
          if (!this.isLoading && !this.isRefreshing) {
            this.onLoadMore();
          }
        });
      }
      .width('100%')
      .height('100%');
    }
    .width('100%')
    .height('100%');
  }

  // 构建选项卡项
  @Builder
  buildTab(tabText: string, status: string) {
    Column() {
      Text(tabText)
        .fontSize(16)
        .fontColor(this.selectedTab === status ? '#FFFFFF' : '#E0E0E0')
        .margin({ top: 10 });

      if (this.selectedTab === status) {
        Column() {}.width(40).height(3).backgroundColor('#FFFFFF').margin({ top: 5 });
      }
    }
    .width('25%')
    .height('100%')
    .backgroundColor('#2BCDDC')
    .onClick(() => {
      this.selectedTab = status;
    });
  }

  // 构建单个订单项
  @Builder
  buildOrderItem(item: OrderItem) {
    Column({ space: 6 }) {
      this.renderOrderItem(item);
    }
    .backgroundColor('#ECFDFA')
    .width('100%')
.height(230)
  }

  // 渲染不同状态的订单内容
  @Builder
  renderOrderItem(item: OrderItem) {
    Column() {
      // 通用头部：店铺名称 + 状态标签
      Row({ space: 20 }) {
        Text(item.shopName)
          .fontSize(18)
          .fontColor('#333333')
          .fontWeight(FontWeight.Bold)
          .flexGrow(1);
        Text(item.status)
          .fontSize(14)
          .fontColor(this.getStatusColor(item.status))
          .backgroundColor(this.getStatusBgColor(item.status))
          .padding({ left: 8, right: 8, top: 2, bottom: 2 })
          .borderRadius(4);
      }
      .padding({ bottom: 10 });

      // 根据订单状态渲染不同内容
      if (item.status === '待接单') {
        // 待接单状态布局
        Column({ space: 5 }) {
          Text(item.address || '')
            .fontSize(14)
            .fontColor('#666');
          Text(item.time || '')
            .fontSize(14)
            .fontColor('#999');
          Text(`已等待 ${item.waitTime}`)
            .fontSize(14)
            .fontColor('#999');

          // 操作按钮行
          Row({ space: 10 }) {
            Button('提醒接单')
              .fontSize(14)
              .fontColor('#FF5E81')
              .backgroundColor('#FFFFFF')
              .border({ width: 1, color: '#FF5E81', radius: 8 })
              .padding({ left: 12, right: 12, top: 6, bottom: 6 })
              .onClick(() => {
                console.log(`提醒接单：${item.shopName}`);
                prompt.showToast({ message: '已提醒接单', duration: 1500 });
              });

            Button('取消订单')
              .fontSize(14)
              .fontColor('#FFFFFF')
              .backgroundColor('#FF5E81')
              .borderRadius(8)
              .padding({ left: 12, right: 12, top: 6, bottom: 6 })
              .onClick(() => {
                console.log(`取消订单：${item.shopName}`);
                prompt.showToast({ message: '已取消订单', duration: 1500 });
                // 实际项目中应从列表移除订单或更新状态
              });
          }
          .justifyContent(FlexAlign.End)
          .margin({ top: 10 });
        }
        .padding({ bottom: 5 })
        .width('90%')
      } else {
        // 已接单/回收中/已完成状态布局
        Row({ space: 10 }) {
          // 收货员头像
          Image($r("app.media.Recycle_a"))
            .width(60)
            .height(60)
            .borderRadius(30)
            .objectFit(ImageFit.Cover);

          // 收货员信息列
          Column({ space: 5 }) {
            Text(item.staffName || '')
              .fontSize(16)
              .fontColor('#333333');
            Text(item.staffPhone || '')
              .fontSize(14)
              .fontColor('#999999');
            Text(`已等待 ${item.waitTime}`)
              .fontSize(14)
              .fontColor('#999999');
          }
          .flexGrow(1);

          // 操作按钮列
          Column({ space: 10 }) {
            Button('致电收货员')
              .fontSize(14)
              .fontColor('#FF5E81')
              .backgroundColor('#FFFFFF')
              .border({ width: 1, color: '#FF5E81', radius: 8 })
              .padding({ left: 12, right: 12, top: 6, bottom: 6 })
              .onClick(() => {
                console.log(`致电 ${item.staffName}：${item.staffPhone}`);
                prompt.showToast({ message: '已致电收货员', duration: 1500 });
              });

            Button('取消订单')
              .fontSize(14)
              .fontColor('#FFFFFF')
              .backgroundColor('#FF5E81')
              .borderRadius(8)
              .padding({ left: 12, right: 12, top: 6, bottom: 6 })
              .onClick(() => {
                console.log(`取消 ${item.shopName} 的订单`);
                prompt.showToast({ message: '已取消订单', duration: 1500 });
              });
          }
        }
        .padding({ bottom: 5 })
        .width('90%')
      }
    }
    .padding(15)
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
    .margin({ left: 5, right: 5 })

  }

  // 根据订单状态获取标签颜色
  getStatusColor(status: string): ResourceStr {
    switch (status) {
      case '待接单': return '#FF5E81';
      case '已接单': return '#2BCDDC';
      case '回收中': return '#36B37E';
      case '已完成': return '#6B778C';
      default: return '#333333';
    }
  }

  // 根据订单状态获取标签背景色
  getStatusBgColor(status: string): ResourceStr {
    switch (status) {
      case '待接单': return '#FFE6EC';
      case '已接单': return '#E5F6F8';
      case '回收中': return '#E5F6EC';
      case '已完成': return '#F5F7FA';
      default: return '#ECECEC';
    }
  }

  // 下拉刷新逻辑
  onPullRefresh() {
    this.isRefreshing = true;
    this.pageIndex = 1;

    setTimeout(() => {
      // 模拟刷新数据
      const newData: OrderItem[] = [
        {
          shopName: 'OMINI新天地店',
          status: this.selectedTab,
          waitTime: '00:05:22',
          address: '上海市黄浦区马当路245号新天地北里1层12号',
          time: '2025-07-16 11:30:00'
        }
      ];

      if (this.selectedTab === '已接单') {
        newData[0].distance = '1.5 公里';
        newData[0].staffName = '刘师傅';
        newData[0].staffPhone = '13877665544';
      }

      this.orderList = newData;
      this.isRefreshing = false;
      prompt.showToast({ message: '刷新成功' });
    }, 1500);
  }

  // 上拉加载更多逻辑
  onLoadMore() {
    this.isLoading = true;
    this.pageIndex++;

    setTimeout(() => {
      // 模拟加载更多数据
      const moreData: OrderItem[] = [
        {
          shopName: 'OMINI南京东路店',
          status: this.selectedTab,
          waitTime: '00:18:45',
          address: '上海市黄浦区南京东路829号第一食品商店3层',
          time: '2025-07-16 10:50:30'
        }
      ];

      if (this.selectedTab === '已接单') {
        moreData[0].distance = '2.8 公里';
        moreData[0].staffName = '陈师傅';
        moreData[0].staffPhone = '13766554433';
      }

      this.orderList = [...this.orderList, ...moreData];
      this.isLoading = false;
      prompt.showToast({ message: '加载更多成功' });
    }, 1500);
  }
}