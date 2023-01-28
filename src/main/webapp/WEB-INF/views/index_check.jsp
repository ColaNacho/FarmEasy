<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="images/favi.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/index_check.css">
<title>게시판</title>

<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/77e29b57dd.js"
	crossorigin="anonymous"></script>
<script src="js/index.js" defer></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
        var len = 4;

        $(document).ready(function(){
        $('#a_click').on({
            click:function(e){
            var checkedLen = $('input:checked').length;
            var valueCheckedLen = $('input[value="Y"]:checked').length;
            if(len == checkedLen){
                $('.cnt').text(valueCheckedLen);
                location.href="/FarmEasy/check_score.do?m_score="+valueCheckedLen;
                e.preventDefault();
              
            }else{
                alert((len-checkedLen)+"개의 질문에 입력을 하지 않았습니다. ")
            }
        }
        });
      });
        
        $(document).ready(function(){
            $('#a_click_nonMember').on({
                click:function(e){
                var checkedLen = $('input:checked').length;
                var valueCheckedLen = $('input[value="Y"]:checked').length;
                if(len == checkedLen){
                    $('.cnt').text(valueCheckedLen);
                    e.preventDefault();
                }else{
                    alert((len-checkedLen)+"개의 질문에 입력을 하지 않았습니다. ")
                }
            }
            });
          });
</script>
</head>
<body>
	<!-- nav 시작 -->
	<!-- container -->
	<nav class="navbar">
		<!-- logo -->
		<div class="navbar-logo">
			<a href="index">귀농쉽농</a>
		</div>
		<!-- menu -->
		<ul class="navbar-menu">
			<li class="depth1">
				<a href="/a_select_step">길라잡이</a>
				<ul class="submenu">
					<li><a href="a_select_step">귀농절차</a></li>
					<li><a href="a_select_chung">지역선정</a></li>
				</ul>
			</li>
			<li class="depth1"><a href="/b_all_info">정책 조회</a>
				<ul class="submenu">
					<li><a href="/b_all_info/충청">충청도 정책</a></li>
					<li><a href="/b_all_info/경상">경상도 정책</a></li>
					<li><a href="/b_all_info/전라">전라도 정책</a></li>
				</ul></li>
			<li class="depth1"><a href="/c_bigData/포도">농작물 빅데이터</a></li>
			<li class="depth1"><a href="/d_board">게시판</a>
				<ul class="submenu">
					<li><a href="/d_board">게시판</a></li>
					<li><a href="d_notice">갤러리</a></li>
				</ul>
			</li>
		</ul>
		<!-- icon -->
		<ul class="navbar-icon">
	 	<c:choose>
		<c:when test="${mvo.m_id eq null}">
				<li><a href="/e_login">로그인</a></li>
				<li><a href="/e_signup">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/e_logout">로그아웃</a></li>
				<li><a href="/f_myPage/${mvo.m_seq}">${mvo.m_id} 님</a></li>
			</c:otherwise>
		</c:choose> 
		</ul>
		<a href="#" class="navbar-more"> <i class='fa fa-bars'
			style='color: white; margin-top: 14px;'></i>
		</a>
	</nav>


	<!-- nav 끝 -->

<div class="wd-basic-960 mb-auto mt-5 mb-4" id="check_score">
    <h4 class="mb-4">귀농 단계별 체크리스트</h4>
    <p>· 귀농 단계별 체크리스트를 작성하여 단계별 부족한 점을 보완하여 효율적인 귀농계획을 수립하도록 합니다.</p>
    <p style="color:tomato; font-weight:700;">**비회원은 점수가 저장되지 않습니다.**</p>
    <form>
      <table>
          <tr>
            <td>단계</td>
            <td>체크 내용</td>
            <td>YES</td>
            <td>NO</td>
          </tr>
          <!-- Q1. 귀농결심 수집 -->
          <tr>
            <td rowspan="2" class="ft-bold">귀농결심</td>
            <td>귀농결정에 대한 2년 이상 고민 했습니까?</td>
            <td><label for="aa01" name="chk01"><input type="radio" id="aa01" name="chk01" class="input_radios" value="Y"></label></td>
            <td><label for="aa02" name="chk01"><input type="radio" id="aa02" name="chk01" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>귀농을 결심하게 된 이유와 목적이 분명합니까?</td>
            <td><label for="bb01" name="chk02"><input type="radio" id="bb01" name="chk02" class="input_radios" value="Y"></label></td>
            <td><label for="bb02" name="chk02"><input type="radio" id="bb02" name="chk02" class="input_radios" value="N"></label></td>
          </tr>
          <!-- Q2. 귀농 정보 수집 -->
          <tr>
            <td rowspan="3" class="ft-bold">귀농 정보 수집</td>
            <td>민·관·학계 및 인터넷상의 귀농정보를 모두 수집하고 있나요?</td>
            <td><label for="cc01" name="chk03"><input type="radio" id="cc01" name="chk03" class="input_radios" value="Y"></label></td>
            <td><label for="cc02" name="chk03"><input type="radio" id="cc02" name="chk03" class="input_radios" value="N"></label></td>
          </tr>
          <!-- 3번째 질문 끝-->
          <tr>
            <td>귀농인을 적극적으로 유치하는 지자체를 2군데 이상 방문해 봤습니까?</td>
            <td><label for="dd01" name="chk04"><input type="radio" id="dd01" name="chk04" class="input_radios" value="Y"></label></td>
            <td><label for="dd02" name="chk04"><input type="radio" id="dd02" name="chk04" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>농작업은 계절마다 다릅니다. 귀농 현장 답사시 한 장소에 세 번이상 방문하였습니까?</td>
            <td><label for="ee01" name="chk05"><input type="radio" id="ee01" name="chk05" class="input_radios" value="Y"></label></td>
            <td><label for="ee02" name="chk05"><input type="radio" id="ee02" name="chk05" class="input_radios" value="N"></label></td>
          </tr>
          <!-- Q3. 귀농 교육 수강 -->
          <tr>
            <td rowspan="3" class="ft-bold">귀농 교육 수강</td>
            <td>귀농교육은 교차수강이 필요합니다. 민·관·학계의 귀농교육을 골고루 수강했나요?</td>
            <td><label for="ff01" name="chk06"><input type="radio" id="ff01" name="chk06" class="input_radios" value="Y"></label></td>
            <td><label for="ff02" name="chk06"><input type="radio" id="ff02" name="chk06" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>주말농장 경험 또는 텃밭농사를 1년 이상 지어 보셨습니까?</td>
            <td><label for="gg01" name="chk07"><input type="radio" id="gg01" name="chk07" class="input_radios" value="Y"></label></td>
            <td><label for="gg02" name="chk07"><input type="radio" id="gg01" name="chk07" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>교육수강 후 귀농한 농자에서 한 작목의 시작부터 수확까지 모든 과정을 경험해 봤나요?</td>
            <td><label for="hh01" name="chk08"><input type="radio" id="hh01" name="chk08" class="input_radios" value="Y"></label></td>
            <td><label for="hh02" name="chk08"><input type="radio" id="hh02" name="chk08" class="input_radios" value="N"></label></td>
          </tr>
          <!-- Q4. 가족 동의 -->
          <tr>
            <td rowspan="2" class="ft-bold">귀농 교육 수강</td>
            <td>배우자 및 자녀의 동의를 구했나요?</td>
            <td><label for="ii01" name="chk09"><input type="radio" id="ii01" name="chk09" class="input_radios" value="Y"></label></td>
            <td><label for="ii02" name="chk09"><input type="radio" id="ii02" name="chk09" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>자녀의 미래교육문제에 대해 부부(가족) 간 합의를 하셨나요?</td>
            <td><label for="jj01" name="chk10"><input type="radio" id="jj01" name="chk10" class="input_radios" value="Y"></label></td>
            <td><label for="jj02" name="chk10"><input type="radio" id="jj02" name="chk10" class="input_radios" value="N"></label></td>
          </tr>
            <!-- 10번째 질문 끝 -->
            <!-- Q5. 자금계획 -->
          <tr>
            <td rowspan="6" class="ft-bold">자금계획</td>
            <td>농업소득과 자기자금으로 2~3년은 생활이 가능합니까?</td>
            <td><label for="kk01" name="chk11"><input type="radio" id="kk01" name="chk11" class="input_radios" value="Y"></label></td>
            <td><label for="kk02" name="chk11"><input type="radio" id="kk02" name="chk11" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>농작물마다 초기 자본금이 다른데, 그것에 대해 알고 있나요?</td>
            <td><label for="ll01" name="chk12"><input type="radio" id="ll01" name="chk12" class="input_radios" value="Y"></label></td>
            <td><label for="ll02" name="chk12"><input type="radio" id="ll02" name="chk12" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>정부의 귀농창업자금지원에 대해 잘 알고 있나요?</td>
            <td><label for="mm01" name="chk13"><input type="radio" id="mm01" name="chk13" class="input_radios" value="Y"></label></td>
            <td><label for="mm02" name="chk13"><input type="radio" id="mm02" name="chk13" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>가족 중 농업 외 소득을 올릴 아이템이 있습니까?</td>
            <td><label for="nn01" name="chk14"><input type="radio" id="nn01" name="chk14" class="input_radios" value="Y"></label></td>
            <td><label for="nn02" name="chk14"><input type="radio" id="nn02" name="chk14" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>영농에 필요한 자금계획은 세워져 있습니까?<br>
              (초기 설비투자자금과 1년간의 자재 및 재료비, 농지구입시 토지대금)</td>
            <td><label for="oo01" name="chk15"><input type="radio" id="oo01" name="chk15" class="input_radios" value="Y"></label></td>
            <td><label for="oo02" name="chk15"><input type="radio" id="oo02" name="chk15" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>회사원일 때는 급여에서 차감되어 온 세금 및 4대보험 중에서 주민세, 건강보험료는<br>
              전년도 소득을 기준으로 과세됩니다. 이에 대하여 고려하고 있습니까?</td>
             <td><label for="pp01" name="chk16"><input type="radio" id="pp01" name="chk16" class="input_radios" value="Y"></label></td>
             <td><label for="pp02" name="chk16"><input type="radio" id="pp01" name="chk16" class="input_radios" value="N"></label></td>
          </tr>
           <!-- Q6. 작목 확정 및 귀농계획서 작성 -->
          <tr>
            <td rowspan="10" class="ft-bold">작목 확정 및 귀농계획서 작성</td>
            <td>작목은 선택했습니까? (어떤 작물을 재배할 것입니까?)</td>
            <td><label for="qq01" name="chk17"><input type="radio" id="qq01" name="chk17" class="input_radios" value="Y"></label></td>
            <td><label for="qq02" name="chk17"><input type="radio" id="qq02" name="chk17" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>선정할 작목에 대해 가족의 이해가 있나요?</td>
            <td><label for="rr01" name="chk18"><input type="radio" id="rr01" name="chk18" class="input_radios" value="Y"></label></td>
            <td><label for="rr02" name="chk18"><input type="radio" id="rr02" name="chk18" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>경영형태(단일경영 또는 복합경영)는 선택했습니까?</td>
            <td><label for="ss01" name="chk19"><input type="radio" id="ss01" name="chk19" class="input_radios" value="Y"></label></td>
            <td><label for="ss02" name="chk19"><input type="radio" id="ss02" name="chk19" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>선정할 작목의 최근 5년간 가격등락폭에 대해 알고 있나요?</td>
            <td><label for="tt01" name="chk20"><input type="radio" id="tt01" name="chk20" class="input_radios" value="Y"></label></td>
            <td><label for="tt02" name="chk20"><input type="radio" id="tt02" name="chk20" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>선정할 작목과 귀농지역의 농업환경이 잘 맞습니까?</td>
            <td><label for="uu01" name="chk21"><input type="radio" id="uu01" name="chk21" class="input_radios" value="Y"></label></td>
            <td><label for="uu02" name="chk21"><input type="radio" id="uu02" name="chk21" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>선정할 작목이 가급적 저장성이 있거나 택배 발송이 가능한 작목입니까?</td>
            <td><label for="vv01" name="chk22"><input type="radio" id="vv01" name="chk22" class="input_radios" value="Y"></label></td>
            <td><label for="vv02" name="chk22"><input type="radio" id="vv02" name="chk22" class="input_radios" value="N"></label></td>
          </tr> 
          <tr>
            <td>선정할 작목이 외국에서 수입되고 있다면 수입농산물의 가격과 동향을 파악 했나요?</td>
            <td><label for="ww01" name="chk23"><input type="radio" id="ww01" name="chk23" class="input_radios" value="Y"></label></td>
            <td><label for="ww02" name="chk23"><input type="radio" id="ww02" name="chk23" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>선정할 작목에 필요한 농기계 이용 대책은 있나요?</td>
            <td><label for="xx01" name="chk24"><input type="radio" id="xx01" name="chk24" class="input_radios" value="Y"></label></td>
            <td><label for="xx02" name="chk24"><input type="radio" id="xx02" name="chk24" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>선택작목의 생산기술은 습득하고 있습니까? 또는 귀농 후에 기술 습득이 가능합니까?</td>
            <td><label for="yy01" name="chk25"><input type="radio" id="yy01" name="chk25" class="input_radios" value="Y"></label></td>
            <td><label for="yy02" name="chk25"><input type="radio" id="yy01" name="chk25" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>귀농현장전문가의 도움을 받아 귀농계획서를 작성했나요?</td>
            <td><label for="zz01" name="chk26"><input type="radio" id="zz01" name="chk26" class="input_radios" value="Y"></label></td>
            <td><label for="zz02" name="chk26"><input type="radio" id="zz01" name="chk26" class="input_radios" value="N"></label></td>
          </tr> 
          <!-- 26번째 질문 끝 -->
          <!-- Q7. 시설 확보 및 판매 계획 -->
          <tr>
            <td rowspan="4" class="ft-bold">시설 확보 및 판매 계획</td>
            <td>농업기계·시설 확보(구입 및 차입) 계획을 세웠습니까?</td>
            <td><label for="ab01" name="chk27"><input type="radio" id="ab01" name="chk27" class="input_radios" value="Y"></label></td>
            <td><label for="ab02" name="chk27"><input type="radio" id="ab02" name="chk27" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>귀농 첫 해 농사계획을 세웠습니까?</td>
            <td><label for="ac01" name="chk28"><input type="radio" id="ac01" name="chk28" class="input_radios" value="Y"></label></td>
            <td><label for="ac02" name="chk28"><input type="radio" id="ac02" name="chk28" class="input_radios" value="N"></label></td>
          </tr>  
          <tr>
            <td>농작물 생산 후 판매계획을 세웠습니까?</td>
            <td><label for="ad01" name="chk29"><input type="radio" id="ab01" name="chk29" class="input_radios" value="Y"></label></td>
            <td><label for="ad02" name="chk29"><input type="radio" id="ab02" name="chk29" class="input_radios" value="N"></label></td>
          </tr> 
          <tr>
            <td>인터넷 활용 계획은 세우셨습니까?(블로그/카페/홈페이지 등)</td>
            <td><label for="ae01" name="chk30"><input type="radio" id="ae01" name="chk30" class="input_radios" value="Y"></label></td>
            <td><label for="ae02" name="chk30"><input type="radio" id="ae02" name="chk30" class="input_radios" value="N"></label></td>
          </tr>  
            <!-- Q8. 귀농지 선정 -->
          <tr>
            <td rowspan="8" class="ft-bold">귀농지 선정</td>
            <td>귀농지는 농업 경영목표의 작목 및 재배방법의 선택과 일치합니까?</td>
            <td><label for="af01" name="chk31"><input type="radio" id="af01" name="chk31" class="input_radios" value="Y"></label></td>
            <td><label for="af02" name="chk31"><input type="radio" id="af02" name="chk31" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>선택작목의 주산지로서 생산기술 지도체계 및 생산물 출하,  <br>
              판매 체계가 정비되어 있고 신규 귀농인의 지원도 기대할 수 있습니까?</td>
            <td><label for="ag01" name="chk32"><input type="radio" id="ag01" name="chk32" class="input_radios" value="Y"></label></td>
            <td><label for="ag02" name="chk32"><input type="radio" id="ag02" name="chk32" class="input_radios" value="N"></label></td>
          </tr>  
          <tr>
            <td>귀농지의 시·군·(읍·면)의 행정 등이 신규 귀농인을 받아들이 기에 적극적이고,  <br>
              연수부터 영농까지 체계적인 지원 장치가 있습니까?</td>
            <td><label for="ah01" name="chk33"><input type="radio" id="ah01" name="chk33" class="input_radios" value="Y"></label></td>
            <td><label for="ah02" name="chk33"><input type="radio" id="ah02" name="chk33" class="input_radios" value="N"></label></td>
          </tr> 
          <tr>
            <td>생활조건(시내중심까지의 거리 및 도로, 교통사정, 학교, 병원, 상점까지의 거리)을 충분히 검토하였습니까?</td>
            <td><label for="ai01" name="chk34"><input type="radio" id="ai01" name="chk34" class="input_radios" value="Y"></label></td>
            <td><label for="ai02" name="chk34"><input type="radio" id="ai02" name="chk34" class="input_radios" value="N"></label></td>
          </tr> 
          <tr>
            <td>귀농지를 선정시, 결정을 내리기 전에 가족 전원이 현지에 동행한 적이 있습니까?</td>
            <td><label for="aj01" name="chk35"><input type="radio" id="aj01" name="chk35" class="input_radios" value="Y"></label></td>
            <td><label for="aj02" name="chk35"><input type="radio" id="aj02" name="chk35" class="input_radios" value="N"></label></td>
          </tr>  
          <tr>
            <td>현지를 답사했을 때, 현지의 농가(주민)로부터 적극적으로 현지상황에 대하여 이야기를 들었습니까?</td>
            <td><label for="ak01" name="chk36"><input type="radio" id="ak01" name="chk36" class="input_radios" value="Y"></label></td>
            <td><label for="ak02" name="chk36"><input type="radio" id="ak02" name="chk36" class="input_radios" value="N"></label></td>
          </tr> 
          <tr>
            <td>농지확보(구입 또는 임대)를 할 수 있는 정보를 갖고 있습니까?</td>
            <td><label for="al01" name="chk37"><input type="radio" id="al01" name="chk37" class="input_radios" value="Y"></label></td>
            <td><label for="al02" name="chk37"><input type="radio" id="al02" name="chk37" class="input_radios" value="N"></label></td>
          </tr>  
          <tr>
            <td>귀농지에서 귀농한 이후에 도와줄 사람이 있습니까?</td>
            <td><label for="am01" name="chk38"><input type="radio" id="am01" name="chk38" class="input_radios" value="Y"></label></td>
            <td><label for="am02" name="chk38"><input type="radio" id="am02" name="chk38" class="input_radios" value="N"></label></td>
          </tr>  
           <!-- Q8. 주택 및 농지매입 -->
           <tr>
            <td rowspan="4" class="ft-bold">주택 및 농지매입</td>
            <td>귀농계획의 실행에 적합한 농지와 주택인가요?</td>
            <td><label for="an01" name="chk39"><input type="radio" id="an01" name="chk39" class="input_radios" value="Y"></label></td>
            <td><label for="an02" name="chk39"><input type="radio" id="an02" name="chk39" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>농지매입시 주변지가를 파악했나요?</td>
            <td><label for="ao01" name="chk40"><input type="radio" id="an01" name="chk40" class="input_radios" value="Y"></label></td>
            <td><label for="ao02" name="chk40"><input type="radio" id="an02" name="chk40" class="input_radios" value="N"></label></td>
          </tr>  
          <tr>
            <td>구입하려는 농지가 농지원부발급대상 농지인지 시·군청에 확인했나요?</td>
            <td><label for="ap01" name="chk41"><input type="radio" id="ap01" name="chk41" class="input_radios" value="Y"></label></td>
            <td><label for="ap02" name="chk41"><input type="radio" id="ap02" name="chk41" class="input_radios" value="N"></label></td>
          </tr> 
          <tr>
            <td>매입할 부지의 도로, 교통사정, 학교, 병원, 공공시설로의 접근성은 검토 하였습니까?</td>
            <td><label for="aq01" name="chk42"><input type="radio" id="aq01" name="chk42" class="input_radios" value="Y"></label></td>
            <td><label for="aq02" name="chk42"><input type="radio" id="aq02" name="chk42" class="input_radios" value="N"></label></td>
          </tr> 
          <!-- Q8. 주택 및 농지매입 -->
          <tr>
            <td rowspan="3" class="ft-bold">영농 및 정착</td>
            <td>동네의 경조사와 지역의 사회활동에 참여할 예정입니까?</td>
            <td><label for="ar01" name="chk43"><input type="radio" id="ar01" name="chk43" class="input_radios" value="Y"></label></td>
            <td><label for="ar02" name="chk43"><input type="radio" id="ar02" name="chk43" class="input_radios" value="N"></label></td>
          </tr>
          <tr>
            <td>선정한 작목과 관련한 지역의 작목반 및 관련연구회를 알아 보고 참여할 예정입니까?</td>
            <td><label for="as01" name="chk44"><input type="radio" id="as01" name="chk44" class="input_radios" value="Y"></label></td>
            <td><label for="as02" name="chk44"><input type="radio" id="as02" name="chk44" class="input_radios" value="N"></label></td>
          </tr>  
          <tr>
            <td>농촌에서는 영농을 위해서라도 그 지역 주민과 사귀는 것이 중요합니다. <br>
              이렇게 적극적으로 주민들과 유대할 준비가 되어 있습니까?</td>
              <td><label for="at01" name="chk45"><input type="radio" id="at01" name="chk45" class="input_radios" value="Y"></label></td>
              <td><label for="at02" name="chk45"><input type="radio" id="at02" name="chk45" class="input_radios" value="N"></label></td>
          </tr> 
      </table>
    </form>  
  </div>

  <div class="wd-basic-960 mb-auto click-wrap">
  	<form id="check_score" name="check_score" >

    	<c:choose>
    		<c:when test="${sessionScope.m_id eq null}">
    		  <input type="submit" value="결과값 확인" id="a_click_nonMember">
    			비회원입니다.
    			<p class="cnt_name">자가 진단 점수는 총 <input type="hidden" name="cnt">
    			<span class="cnt">00</span>점입니다.</p>
    		</c:when>
    		<c:when test="${m_score eq null}">
    		   	<input type="submit" value="결과값 확인" id="a_click">
    		   		<p class="cnt_name">자가 진단 점수는 총 <input type="hidden" name="cnt">
    			<span>00</span>점입니다.</p>
    		</c:when>
    		<c:otherwise>
    		   	<input type="submit" value="결과값 확인" id="a_click">
    		   		<p class="cnt_name">자가 진단 점수는 총 <input type="hidden" name="cnt">
    			<span> ${m_score} </span>점입니다.</p>
    		</c:otherwise>
    	</c:choose>
    </form>
  </div>
  
  

	<!-- 푸터 -->
	<footer>
		<div class="container">
			<div>
				<span>&copy; 귀농 인구를 위한 지역 및 농작물 추천 서비스</span>
			</div>
			<ul>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<img src="images/iconmonstr-twitter-4.svg"></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<img src="images/iconmonstr-facebook-4.svg"></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<img src="images/iconmonstr-instagram-14.svg"></svg></a></li>
			</ul>
		</div>
	</footer>

</body>
</html>