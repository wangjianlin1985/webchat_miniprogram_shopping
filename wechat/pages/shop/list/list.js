var app = getApp()
Page({
  data:{
    current: 0,
    listgoods:[],  
  swiper:{
      indicatorDots: false,
      autoplay: false,
      interval: 5000,
      duration: 1000
      }
  },
  onPullDownRefresh: function () {
    console.log('onPullDownRefresh')
  },
  onLoad:function(options){
    // 页面初始化 options为页面跳转所带来的参数
     console.log("列表页面数据============================================");
      console.log(options);

    //调用应用实例的方法获取全局数据
    var that = this;
   

    //通过原生调取数据
    wx.request({
      url: app.getUrl()+"/goods_userList.do?ppId="+options.ppId,
      method: "Post",
      header: {
        "content-type": "application/json"
      },
      success: function (a) {
        var da = a.data.newgoods;
        da = JSON.stringify(da)
        da = decodeURIComponent(da);

        that.setData({"listgoods":a.data.newgoods});
        console.log("================================");
      },
      fail: function (err) {
        console.log(err)
      }
    })
   
    console.log(this.data.listgoods);
    switch1(this.data.listgoods);
    
  },
  //详情页跳转
  lookdetail:function(e){
    var lookid=e.currentTarget.dataset;
    console.log(e.currentTarget.dataset.id);
    wx.navigateTo({
      url:"/pages/shop/detail/detail?id="+lookid.id
    })
  },
  switchSlider:function(e){
    this.setData({
      current:e.target.dataset.index
    })
  },
  changeSlider:function(e){
    this.setData({
      current: e.detail.current
    })
  },
  onReady:function(){
    // 页面渲染完成
  },
  onShow:function(){
    // 页面显示
  },
  onHide:function(){
    // 页面隐藏
  },
  onUnload:function(){
    // 页面关闭
  }

})
