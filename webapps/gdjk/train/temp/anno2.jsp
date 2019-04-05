<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<ul class="content-list" style="line-height: 40px;font-size: 16px">
</ul>

<script>
var arr=[
'财经 | 侠客岛：中美磋商最新成果这三个词语暗藏深意',
'央视：中美此次经贸磋商是积极的建设性的富有成果的',
'2018清华五道口全球金融论坛探讨监管与风险防范',
'股票 | 养猪靠政府补贴盈利 罗牛山278亿豪赌赛马市场',
'11城专家谈抢人大战 万科一天出现26笔大宗交易',
'科技 | 陆奇卸任 百度收盘大跌9.54%',
'追赶世界科技创新 中国技术创业迎来新投资窗口',
'走进实验室：丝绸之路上的神秘黑科技 这样打架的小兔',
'汽车 | 大众卡客车CFO辞职 特斯拉上海厂址无办公迹象',
'时尚 | 大魔王的时尚超纲玩法 上海女人最看重姿态',
'热点 | 520腕表表白秘籍 对胃口的就是好威士忌',
'关注 | 范冰冰敢穿因为皮肤白 睡进日本寺院找自己',
'必看 | 董明珠一人一套房 天津发布人才引进新政',
         ]
for(var i=0;i<15;i++){
	$(".content-list").append("<li><a href='#'>"+arr[Math.floor(Math.random()*10)]+"</a></li>")
}
</script>