webpackJsonp([10],{"4PNH":function(e,t){},cEwM:function(e,t,o){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var n={name:"forgetPass",data:function(){return{photoCode:null,seconds:20,disableBut:!1,phoneNum:"",phoneCode:""}},computed:{},components:{},created:function(){},methods:{onClickLeft:function(){this.$router.go(-1)},showPhotoCode:function(){this.$refs.Imgdata.src="http://47.92.129.86:80/api/Registercontroller/photoCode.do?time="+(new Date).getTime()},getTimesec:function(){var e=this;return e._timer=setInterval(function(){e.seconds=e.seconds-1,1==e.seconds&&clearInterval(e._timer)},1e3),e.seconds},obMobileCode:function(){var e=this;if(e.$_.isEmpty(e.phoneNum))e.$toast("手机号不能为空");else if(e.phoneNum<12999999999||e.phoneNum>18999999999)e.$toast("请填写正确手机号");else if(e.$_.isEmpty(e.photoCode))e.$toast("请填写图片验证码");else{e.seconds=20,e.disableBut=!0,e.getTimesec(),setTimeout(function(){e.disableBut=!1},2e4);var t=new URLSearchParams;t.append("phone",e.phoneNum),t.append("photoCode",e.photoCode),e.$axios.post("/api/Registercontroller/sendMsg.do",t).then(function(t){200==t.status?"fail"!=t.data.status?console.log("成功"):(e.disableBut=!1,clearInterval(e._timer),e.$toast(t.data.message)):(e.disableBut=!1,clearInterval(e._timer),e.$toast("获取验证码失败"))}).catch(function(t){e.disableBut=!1,clearInterval(e._timer)})}},goLogin:function(){this.$router.push("/newPassword")}}},s={render:function(){var e=this,t=e.$createElement,o=e._self._c||t;return o("div",{staticClass:"mr-root"},[o("van-nav-bar",{attrs:{title:"找回密码","left-arrow":""},on:{"click-left":e.onClickLeft}}),e._v(" "),o("div",{staticClass:"forgetPass"},[o("van-cell-group",[o("van-field",{attrs:{placeholder:"请输入您的手机号",type:"number",icon:"clear"},on:{"click-icon":function(t){e.phoneNum=""}},model:{value:e.phoneNum,callback:function(t){e.phoneNum=t},expression:"phoneNum"}}),e._v(" "),o("van-field",{staticClass:"forgetTwoInput",attrs:{center:"",placeholder:"请输入图片验证码"},model:{value:e.photoCode,callback:function(t){e.photoCode=t},expression:"photoCode"}},[o("template",{slot:"button"},[o("img",{ref:"Imgdata",attrs:{src:"http://47.92.129.86:80/api/Registercontroller/photoCode.do"},on:{click:function(t){e.showPhotoCode()}}})])],2),e._v(" "),o("van-field",{attrs:{center:"",placeholder:"请输入短信验证码"},model:{value:e.phoneCode,callback:function(t){e.phoneCode=t},expression:"phoneCode"}},[e.disableBut?e._e():o("van-button",{attrs:{slot:"button",size:"small",type:"primary"},on:{click:function(t){e.obMobileCode()}},slot:"button"},[e._v("发送验证码")]),e._v(" "),e.disableBut?o("van-button",{attrs:{slot:"button",size:"small",disabled:""},slot:"button"},[e._v(e._s(e.seconds)+"后获取")]):e._e()],1)],1),e._v(" "),o("div",{staticClass:"nextBut"},[o("van-button",{attrs:{type:"danger"},on:{click:function(t){e.goLogin()}}},[e._v("下一步")])],1)],1)],1)},staticRenderFns:[]};var a=o("VU/8")(n,s,!1,function(e){o("4PNH")},null,null);t.default=a.exports}});
//# sourceMappingURL=10.4ff932a9337ec3599f05.js.map