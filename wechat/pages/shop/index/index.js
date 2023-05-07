//index.js
//获取应用实例
var app = getApp()

Page({
  data: {
    toView: "",
    motto: 'MiHome_Store',
    search:"",
    userInfo: {},
    indicatorDots: true,
    autoplay: true,
    interval: 3000,
    duration: 100,
    newgoods2: [
     
    ],
    banner_list: [
      {
        "banner": [
          {
            "pic_url": "../../../images/1.jpg",
          },
          {
            "pic_url": "../../../images/2.jpg",
          },
          {
            "pic_url": "../../../images/3.jpg",
          },
          {
            "pic_url": "../../../images/4.jpg",
          },
          {
            "pic_url": "../../../images/5.jpg",
          }
        ]
      },
      {
        "banner": []
      }
    ]
  },
  onPullDownRefresh: function () {
    console.log('onPullDownRefresh')
  },
  scroll: function (e) {
    if (this.data.toView == "top") {
      this.setData({
        toView: ""
      })
    }
  },

  //事件处理函数
  bindViewTap: function () {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
    //详情页跳转
  lookdetail:function(e){
    var lookid=e.currentTarget.dataset;
    console.log(e.currentTarget.dataset.id);
    wx.navigateTo({
      url:"/pages/shop/detail/detail?id="+lookid.id
    })
  },
  searchinput:function(e){
       this.setData({
            search: e.detail.value
        })
        console.log(this.data.search+"------");
        this.search();
  },
  search:function(){
      var that = this;
        console.log("查询参数。。。。。。。。");
      console.log(that.data.search+"------");
      wx.request({
        url: app.getUrl()+"/goods_userSrarch.do?title="+that.data.search,
        //data: {"title":that.data.search},
        method: 'POST', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
       header: {
        "content-type": "application/json"
      },
        success: function(a){
          // success
            var da = a.data.newgoods;
        da = JSON.stringify(da)
        console.log(da)
        da = decodeURIComponent(da);

        that.setData({"newgoods2":a.data.newgoods});
        },
        fail: function(res) {
          // fail
        },
        complete: function(res) {
          // complete
        }
      })
  },
  tap: function () {
    this.setData({
      toView: "top"
    })
  },
  onLoad: function () {

    //调用应用实例的方法获取全局数据
    var that = this;
   

    //通过原生调取数据
    wx.request({
      url: app.getUrl()+"/login_uIndex.do",
      method: "GET",
      header: {
        "content-type": "application/json"
      },
      success: function (a) {
        var da = a.data.newgoods;
        da = JSON.stringify(da)
        da = decodeURIComponent(da);

        that.setData({"newgoods2":a.data.newgoods});
        console.log("================================");
      },
      fail: function (err) {
        console.log(err)
      }
    })
  
  },
  onShow(){
    wx.request({
      url: app.getUrl()+"/login_uIndex.do",
      method: "GET",
      header: {
        "content-type": "application/json"
      },
      success: function (a) {
        var da = a.data.newgoods;
        da = JSON.stringify(da)
        da = decodeURIComponent(da);

        that.setData({"newgoods2":a.data.newgoods});
        console.log("================================");
      },
      fail: function (err) {
        console.log(err)
      }
    })
  }
})
