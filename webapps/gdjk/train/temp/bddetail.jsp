<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>设备标定记录详情</title>	
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'center',border:false" style="padding:5px;">
        	<h2 style="text-align:center;">${bd.bt}</h2>
        	<table class="detailTb">
        		<tr>
        			<td colspan="3">序列号: ${bd.swinstrumentid}</td>
        			<td colspan="3">时间: ${bd.time}</td>
        			<td colspan="3">温度: ${bd.tempture}</td>
        		</tr>
        		<tr>
        			<td class="bd" class="bd">类别</td>
        			<td colspan="8">${bd.lb}</td>
        		</tr>
        		<tr>
        			<td rowspan="4" class="bd">基础参数</td>
        			<td class="bd">倾角横向修正</td>
        			<td class="bd">倾角纵向修正</td>
        			<td class="bd">倾角横向K值</td>
        			<td class="bd">倾角纵向K值</td>
        			<td class="bd">A端位移K值</td>
        			<td class="bd">B端位移K值</td>
        			<td class="bd">编码器分辨率</td>
        			<td class="bd">中梁温度系数</td>
        		</tr>
        		<tr>					
					<td>${bd.jc_qjhxxz}</td>		
					<td>${bd.jc_qjzxxz}</td>		
					<td>${bd.jc_qjhxkz}</td>		
					<td>${bd.jc_qjzxkz}</td>		
					<td>${bd.jc_adwykz}</td>		
					<td>${bd.jc_bdwykz}</td>		
					<td>${bd.jc_bmqfbl}</td>		
					<td>${bd.jc_zlwdxs}</td>		
        		</tr>
        		<tr>
        			<td class="bd">AB值</td>
        			<td class="bd">A值</td>
        			<td class="bd">B值</td>
        			<td class="bd">C值</td>
        			<td class="bd">D值</td>
        			<td class="bd">AE值</td>
        			<td class="bd">BF值</td>
        			<td class="bd">H值</td>
        		</tr>
        		<tr>
					<td>${bd.jc_abz}</td>	
					<td>${bd.jc_az}</td>	
					<td>${bd.jc_bz}</td>	
					<td>${bd.jc_cz}</td>	
					<td>${bd.jc_dz}</td>	
					<td>${bd.jc_ae}</td>	
					<td>${bd.jc_bf}</td>	
					<td>${bd.jc_hz}</td>	
        		</tr>
        		<tr>
        			<td rowspan="4" class="bd">轮径检测</td>
        			<td class="bd">A前轮径</td>
        			<td class="bd">A后轮径</td>
        			<td class="bd">A1轮径</td>
        			<td class="bd">A2轮径</td>
        			<td class="bd">A3轮径</td>
        			<td class="bd">A4轮径</td>
        			<td colspan="2" class="bd">A测轮径</td>
        		</tr>
        		<tr>
        			<td>${bd.ljjc_aq}</td>
        			<td>${bd.ljjc_ah}</td>
        			<td>${bd.ljjc_a1}</td>
        			<td>${bd.ljjc_a2}</td>
        			<td>${bd.ljjc_a3}</td>
        			<td>${bd.ljjc_a4}</td>
        			<td colspan="2">${bd.ljjc_ac}</td>
        		</tr>
        		<tr>
        			<td class="bd">B前轮径</td>
        			<td class="bd">B后轮径</td>
        			<td class="bd">B1轮径</td>
        			<td class="bd">B2轮径</td>
        			<td class="bd">B3轮径</td>
        			<td class="bd">B4轮径</td>
        			<td colspan="2" class="bd">B测轮径</td>
        		</tr>        		
        		<tr>
        			<td>${bd.ljjc_bq}</td>
        			<td>${bd.ljjc_bh}</td>
        			<td>${bd.ljjc_b1}</td>
        			<td>${bd.ljjc_b2}</td>
        			<td>${bd.ljjc_b3}</td>
        			<td>${bd.ljjc_b4}</td>
        			<td colspan="2">${bd.ljjc_bc}</td>
        		</tr>
        		<tr>
        			<td rowspan="3" class="bd">踏轮垂向间隙</td>
        			<td colspan="2" class="bd">A前</td>
        			<td colspan="2" class="bd">A后</td>
        			<td colspan="2" class="bd">B前</td>
        			<td colspan="2" class="bd">B后</td>
        		</tr>
        		<tr>
        			<td class="bd">最小值</td>
        			<td class="bd">最大值</td>
        			<td class="bd">最小值</td>
        			<td class="bd">最大值</td>
        			<td class="bd">最小值</td>
        			<td class="bd">最大值</td>
        			<td class="bd">最小值</td>
        			<td class="bd">最大值</td>
        		</tr>
        		<tr>
        			<td>${bd.tlcx_aq_min}</td>
        			<td>${bd.tlcx_aq_max}</td>
        			<td>${bd.tlcx_ah_min}</td>
        			<td>${bd.tlcx_ah_max}</td>
        			<td>${bd.tlcx_bq_min}</td>
        			<td>${bd.tlcx_bq_max}</td>
        			<td>${bd.tlcx_bh_min}</td>
        			<td>${bd.tlcx_bh_max}</td>
        		</tr>
        		<tr>
        			<td rowspan="2" class="bd">挡轮横向间隙</td>
        			<td class="bd">A1</td>
        			<td class="bd">A2</td>
        			<td class="bd">A3</td>
        			<td class="bd">A4</td>
        			<td class="bd">B1</td>
        			<td class="bd">B2</td>
        			<td class="bd">B3</td>
        			<td class="bd">B4</td>
        		</tr>
        		<tr>
        			<td>${bd.dlhx_a1}</td>
        			<td>${bd.dlhx_a2}</td>
        			<td>${bd.dlhx_a3}</td>
        			<td>${bd.dlhx_a4}</td>
        			<td>${bd.dlhx_b1}</td>
        			<td>${bd.dlhx_b2}</td>
        			<td>${bd.dlhx_b3}</td>
        			<td>${bd.dlhx_b4}</td>
        		</tr>
        		<tr>
        			<td rowspan="6" class="bd">轨距标定</td>
        			<td class="bd">基准值</td>
        			<td class="bd">实测</td>
        			<td class="bd">差值</td>
        			<td class="bd">备注</td>
        			<td class="bd">基准值</td>
        			<td class="bd">实测</td>
        			<td class="bd">差值</td>
        			<td class="bd">备注</td>
        		</tr>
        		<tr>
        			<td class="bd">1410</td>
        			<td>${bd.gj_shice1410}</td>
        			<td>${bd.gj_chazhi1410}</td>
        			<td>${bd.gj_beizhu1410}</td>
        			<td class="bd">1440</td>
        			<td>${bd.gj_shice1440}</td>
        			<td>${bd.gj_chazhi1440}</td>
        			<td>${bd.gj_beizhu1440}</td>
        		</tr>
        		<tr>
        			<td class="bd">1420</td>
        			<td>${bd.gj_shice1420}</td>
        			<td>${bd.gj_chazhi1420}</td>
        			<td>${bd.gj_beizhu1420}</td>
        			<td class="bd">1445</td>
        			<td>${bd.gj_shice1445}</td>
        			<td>${bd.gj_chazhi1445}</td>
        			<td>${bd.gj_beizhu1445}</td>
        		</tr>
        		<tr>
        			<td class="bd">1425</td>
        			<td>${bd.gj_shice1425}</td>
        			<td>${bd.gj_chazhi1425}</td>
        			<td>${bd.gj_beizhu1425}</td>
        			<td class="bd">1450</td>
        			<td>${bd.gj_shice1450}</td>
        			<td>${bd.gj_chazhi1450}</td>
        			<td>${bd.gj_beizhu1450}</td>
        		</tr>
        		<tr>
        			<td class="bd">1430</td>
        			<td>${bd.gj_shice1430}</td>
        			<td>${bd.gj_chazhi1430}</td>
        			<td>${bd.gj_beizhu1430}</td>
        			<td class="bd">1460</td>
        			<td>${bd.gj_shice1460}</td>
        			<td>${bd.gj_chazhi1460}</td>
        			<td>${bd.gj_beizhu1460}</td>
        		</tr>
        		<tr>
        			<td class="bd">1435</td>
        			<td>${bd.gj_shice1435}</td>
        			<td>${bd.gj_chazhi1435}</td>
        			<td>${bd.gj_beizhu1435}</td>
        			<td class="bd">1470</td>
        			<td>${bd.gj_shice1470}</td>
        			<td>${bd.gj_chazhi1470}</td>
        			<td>${bd.gj_beizhu1470}</td>
        		</tr>
        		<tr>
        			<td rowspan="12" class="bd">超高标定</td>
        			<td class="bd">读数</td>
        			<td class="bd">实测</td>
        			<td class="bd">修正值</td>
        			<td class="bd">差值</td>
        			<td class="bd">读数</td>
        			<td class="bd">实测</td>
        			<td class="bd">修正值</td>
        			<td class="bd">差值</td>
        		</tr>
        		<tr>
        			<td class="bd">0</td>
        			<td>${bd.cg_shice1}</td>
        			<td>${bd.cg_base1}</td>
        			<td>${bd.cg_beizhu1}</td>
        			<td class="bd">0</td>
        			<td>${bd.cg_shice1}</td>
        			<td>${bd.cg_base1}</td>
        			<td>${bd.cg_beizhu1}</td>
        		</tr>
        		<tr>
        			<td class="bd">5</td>
        			<td>${bd.cg_shice2}</td>
        			<td>${bd.cg_base2}</td>
        			<td>${bd.cg_beizhu2}</td>
        			<td class="bd">-5</td>
        			<td>${bd.cg_shice13}</td>
        			<td>${bd.cg_base13}</td>
        			<td>${bd.cg_beizhu13}</td>
        		</tr>
        		<tr>
        			<td class="bd">10</td>
        			<td>${bd.cg_shice3}</td>
        			<td>${bd.cg_base3}</td>
        			<td>${bd.cg_beizhu3}</td>
        			<td class="bd">-10</td>
        			<td>${bd.cg_shice14}</td>
        			<td>${bd.cg_base14}</td>
        			<td>${bd.cg_beizhu14}</td>
        		</tr>
        		<tr>
        			<td class="bd">30</td>
        			<td>${bd.cg_shice4}</td>
        			<td>${bd.cg_base4}</td>
        			<td>${bd.cg_beizhu4}</td>
        			<td class="bd">-30</td>
        			<td>${bd.cg_shice15}</td>
        			<td>${bd.cg_base15}</td>
        			<td>${bd.cg_beizhu15}</td>
        		</tr>
        		<tr>
        			<td class="bd">50</td>
        			<td>${bd.cg_shice5}</td>
        			<td>${bd.cg_base5}</td>
        			<td>${bd.cg_beizhu5}</td>
        			<td class="bd">-50</td>
        			<td>${bd.cg_shice16}</td>
        			<td>${bd.cg_base16}</td>
        			<td>${bd.cg_beizhu16}</td>
        		</tr>
        		<tr>
        			<td class="bd">70</td>
        			<td>${bd.cg_shice6}</td>
        			<td>${bd.cg_base6}</td>
        			<td>${bd.cg_beizhu6}</td>
        			<td class="bd">-70</td>
        			<td>${bd.cg_shice17}</td>
        			<td>${bd.cg_base17}</td>
        			<td>${bd.cg_beizhu17}</td>
        		</tr>
        		<tr>
        			<td class="bd">90</td>
        			<td>${bd.cg_shice7}</td>
        			<td>${bd.cg_base7}</td>
        			<td>${bd.cg_beizhu7}</td>
        			<td class="bd">-90</td>
        			<td>${bd.cg_shice18}</td>
        			<td>${bd.cg_base18}</td>
        			<td>${bd.cg_beizhu18}</td>
        		</tr>
        		<tr>
        			<td class="bd">110</td>
        			<td>${bd.cg_shice8}</td>
        			<td>${bd.cg_base8}</td>
        			<td>${bd.cg_beizhu8}</td>
        			<td class="bd">-110</td>
        			<td>${bd.cg_shice19}</td>
        			<td>${bd.cg_base19}</td>
        			<td>${bd.cg_beizhu19}</td>
        		</tr>
        		<tr>
        			<td class="bd">130</td>
        			<td>${bd.cg_shice9}</td>
        			<td>${bd.cg_base9}</td>
        			<td>${bd.cg_beizhu9}</td>
        			<td class="bd">-130</td>
        			<td>${bd.cg_shice20}</td>
        			<td>${bd.cg_base20}</td>
        			<td>${bd.cg_beizhu20}</td>
        		</tr>
        		<tr>
        			<td class="bd">150</td>
        			<td>${bd.cg_shice10}</td>
        			<td>${bd.cg_base10}</td>
        			<td>${bd.cg_beizhu10}</td>
        			<td class="bd">-150</td>
        			<td>${bd.cg_shice21}</td>
        			<td>${bd.cg_base21}</td>
        			<td>${bd.cg_beizhu21}</td>
        		</tr>
        		<tr>
        			<td class="bd">170</td>
        			<td>${bd.cg_shice11}</td>
        			<td>${bd.cg_base11}</td>
        			<td>${bd.cg_beizhu11}</td>
        			<td class="bd">-170</td>
        			<td>${bd.cg_shice22}</td>
        			<td>${bd.cg_base22}</td>
        			<td>${bd.cg_beizhu22}</td>
        		</tr>
        		<tr>
        			<td rowspan="2" class="bd">重复组合</td>
        			<td colspan="2" class="bd">轨距(<0.15mm)</td>
        			<td colspan="2" class="bd">水平(<0.15mm)</td>
        			<td colspan="2" class="bd">端盒平行(<1mm)</td>
        			<td colspan="2" class="bd">梁盒间隙(<2mm)</td>
        		</tr>
        		<tr>
        			<td class="bd">基准</td>
        			<td class="bd">实测</td>
        			<td class="bd">基准</td>
        			<td class="bd">实测</td>
        			<td class="bd">水平</td>
        			<td class="bd">纵向</td>
        			<td class="bd">A</td>
        			<td class="bd">B</td>
        		</tr>
        		<tr>
        			<td class="bd">1</td>
        			<td class="bd">1435</td>
        			<td>${bd.cf_gj_shice1}</td>
        			<td class="bd">0</td>
        			<td>${bd.cf_sp_shice1}</td>
        			<td>${bd.cf_dh_sp1}</td>
        			<td>${bd.cf_dh_zx1}</td>
        			<td>${bd.cf_lh_jx_a1}</td>
        			<td>${bd.cf_lh_jx_b1}</td>
        		</tr>
        		<tr>
        			<td class="bd">2</td>
        			<td class="bd">1435</td>
        			<td>${bd.cf_gj_shice2}</td>
        			<td class="bd">0</td>
        			<td>${bd.cf_sp_shice2}</td>
        			<td>${bd.cf_dh_sp2}</td>
        			<td>${bd.cf_dh_zx2}</td>
        			<td>${bd.cf_lh_jx_a2}</td>
        			<td>${bd.cf_lh_jx_b2}</td>
        		</tr>
        		<tr>
        			<td class="bd">3</td>
        			<td class="bd">1435</td>
        			<td>${bd.cf_gj_shice3}</td>
        			<td class="bd">0</td>
        			<td>${bd.cf_sp_shice3}</td>
        			<td>${bd.cf_dh_sp3}</td>
        			<td>${bd.cf_dh_zx3}</td>
        			<td>${bd.cf_lh_jx_a3}</td>
        			<td>${bd.cf_lh_jx_b3}</td>
        		</tr>
        		<tr>
        			<td class="bd">4</td>
        			<td class="bd">1435</td>
        			<td>${bd.cf_gj_shice4}</td>
        			<td class="bd">0</td>
        			<td>${bd.cf_sp_shice4}</td>
        			<td>${bd.cf_dh_sp4}</td>
        			<td>${bd.cf_dh_zx4}</td>
        			<td>${bd.cf_lh_jx_a4}</td>
        			<td>${bd.cf_lh_jx_b4}</td>
        		</tr>
        		<tr>
        			<td class="bd">5</td>
        			<td class="bd">1435</td>
        			<td>${bd.cf_gj_shice5}</td>
        			<td class="bd">0</td>
        			<td>${bd.cf_sp_shice5}</td>
        			<td>${bd.cf_dh_sp5}</td>
        			<td>${bd.cf_dh_zx5}</td>
        			<td>${bd.cf_lh_jx_a5}</td>
        			<td>${bd.cf_lh_jx_b5}</td>
        		</tr>
        		<tr>
        			<td class="bd">极值偏差</td>
        			<td></td>
        			<td>${bd.jzpc_2}</td>
        			<td></td>
        			<td>${bd.jzpc_4}</td>
        			<td>${bd.jzpc_5}</td>
        			<td>${bd.jzpc_6}</td>
        			<td>${bd.jzpc_7}</td>
        			<td>${bd.jzpc_8}</td>
        		</tr>
        		<tr>
        			<td colspan="9" style="height: 80px" >${bd.bz}</td>
        		</tr>
        		<tr>
        			<td class="bd">检定员：</td>
        			<td colspan="2">${bd.dsy}</td>
        			<td class="bd">主管：</td>
        			<td colspan="2">${bd.zg}</td>
        			<td class="bd">日期：</td>
        			<td colspan="2">${bd.bdrq}</td>
        		</tr>
        	</table>
        </div>
    </div>
</body>
</html>