webpackJsonp([13],{MwDk:function(t,e){},XLiN:function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var a={name:"my_wallet",data:function(){return{}},methods:{onClickLeft:function(){this.$router.go(-1)}},computed:{},created:function(){sessionStorage.getItem("userInfo")||this.$router.push("/login")}},s={render:function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"mr-root"},[n("van-nav-bar",{attrs:{title:"我的钱包","left-arrow":""},on:{"click-left":t.onClickLeft}}),t._v(" "),n("section",{staticClass:"ob_myWallet_container"},[n("router-link",{attrs:{to:"/wallet_record"}},[n("van-nav-bar",{attrs:{title:"充值/提现记录"}})],1),t._v(" "),n("div",{staticClass:"ob_myWallet_content"},[n("i",{staticClass:"iconfont wallet_icon"}),t._v(" "),t._m(0),t._v(" "),n("div",{staticClass:"ob_myWallet_btns"},[n("router-link",{attrs:{to:"/wallet_in"}},[n("van-button",{attrs:{size:"large",type:"danger"}},[t._v("充值")])],1),t._v(" "),n("router-link",{attrs:{to:"/wallet_out"}},[n("van-button",{attrs:{size:"large"}},[t._v("提现")])],1)],1)])],1)],1)},staticRenderFns:[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"ob_myWallet_num"},[e("em",[this._v("账户资金")]),this._v(" "),e("p",{staticClass:"money_num"},[this._v("188.00")])])}]};var r=n("VU/8")(a,s,!1,function(t){n("MwDk")},null,null);e.default=r.exports}});
//# sourceMappingURL=13.1f81692553ebb6a31604.js.map