Page({
  data:{
    roleType:'',//当前用户类型 1 用户 2 部门经理自己申请 3.部门经理审核 4.总经理
    czType:'',
    ts:''
  },
  onLoad:function(options){
    // 生命周期函数--监听页面加载
    var ts = '';
    if(options.roleType == 1){
          ts ="已成功提交申请,请耐心等待审核哦!";
    }
    if(options.roleType == 3 || options.roleType == 4){
          ts ="操作成功!";
    }
    if(options.roleType==2 && options.czType==1){
         ts ="已成功提交申请,请耐心等待审核哦!";
    }
     this.setData({
       roleType:options.roleType,
       czType:options.czType,
       ts:ts
     });
  },
  onReady:function(){
    // 生命周期函数--监听页面初次渲染完成
  },
  onShow:function(){
    // 生命周期函数--监听页面显示
  },
  onHide:function(){
    // 生命周期函数--监听页面隐藏
  },
  onUnload:function(){
    // 生命周期函数--监听页面卸载
  },
  onPullDownRefresh: function() {
    // 页面相关事件处理函数--监听用户下拉动作
  },
  onReachBottom: function() {
    // 页面上拉触底事件的处理函数
  },
  onShareAppMessage: function() {
    // 用户点击右上角分享
    return {
      title: 'title', // 分享标题
      desc: 'desc', // 分享描述
      path: 'path' // 分享路径
    }
  },
  qd:function(){
    var roleType = this.data.roleType;
    var czType = this.data.czType;
    console.log(this.data);
    var url ='';
    //用户提交
    if(roleType == 1 && czType==1){
     //跳转到列表页面用户可以看到 待审核 审核完成 已还车 4个菜单
     //定义 1 待审核 2 已审核 3已退 4.已还车
      url = '../user/list?type='+czType;
         console.log("url==="+url);
          wx.redirectTo({
          url: url,
          success: function (res) {
            // success
          },
          fail: function () {
            // fail
          },
          complete: function () {
            // complete
          }
        })
    }
     else if(roleType == 2 && czType==1){
     //跳转到列表页面用户可以看到 待审核 审核完成 已还车 4个菜单
     //定义 1 待审核 2 已审核 3已退 4.已还车
        url = '../bmjl/list?type='+czType;
         console.log("url==="+url);
          wx.redirectTo({
          url: url,
          success: function (res) {
            // success
          },
          fail: function () {
            // fail
          },
          complete: function () {
            // complete
          }
        })
    
    }else{
        console.log(getCurrentPages());
        wx.navigateBack({
        delta: 1
      })
    }
 

  }
})