var app = getApp();
Page({
  data:{
      Obj:{},
      detailgood:{},
      listgood:[],
  },
  onLoad:function(options){
    // 页面初始化 options为页面跳转所带来的参数
    var  id=options.id;
     var that = this;
        console.log("查询参数。。。。。。。。");
      wx.request({
        url: app.getUrl()+"/goods_goodsInfo.do?id="+id,
        method: 'POST', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
       header: {
        "content-type": "application/json"
      },
        success: function(a){
          // success
            var da = a.data.newgoods;
           console.log('===========返回参数=================');
             console.log(a);
        that.setData({"Obj":a.data.Obj});
        },
        fail: function(res) {
          // fail
        },
        complete: function(res) {
          // complete
        }
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
  },
  addCar:function(){
   var that = this;
 console.log("加。。");
  wx.getStorage({
    key: 'userId',
    success: function(res){
      console.log("缓存查数据");
       console.log(res);
 wx.request({
        url: app.getUrl()+"/car_exAdd.do?goodsId="+that.data.Obj.id+"&userId="+res.data,
        method: 'POST', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
       header: {
        "content-type": "application/json"
      },
        success: function(a){
          if (a.data.result == 1) {
                           wx.showToast({
                            title: '加入购物车成功',
                            icon: 'success',
                            complete: function () {
                               wx.switchTab({
                                url: '/pages/shop/cart/cart'
                                })
                            }
                        })
            }else{
                 
            }
        },
        fail: function(res) {
             wx.redirectTo({
      url:"/pages/shop/login/login"
    })
        },
        complete: function(res) {
          // complete
        }
      })
    },
    fail: function(res) {
      // fail
       wx.redirectTo({
               url:"/pages/shop/login/login"
             })
    },
    complete: function(res) {
      // complete
    }
  })

  },
   calling:function(){
     console.log("打电话");
    wx.makePhoneCall({
      phoneNumber: '12345678900', //此号码并非真实电话号码，仅用于测试
      success:function(){
        console.log("拨打电话成功！")
      },
      fail:function(){
        console.log("拨打电话失败！")
      }
    })
  }
})
