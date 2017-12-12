<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.gudan.model.GudanDto"%>
<!--header 慎蝕-->
<%@ include file="/common/header.jsp"%>
<%
GudanDto gudanDto = (GudanDto) session.getAttribute("gudandto");
%>
<link rel="stylesheet" type="text/css" HREF="<%=root %>/css/alice.css">
<link rel="stylesheet" type="text/css" HREF="<%=root %>/css/oz.css">
<script type="text/javascript" src="<%=root %>/js/prototype.js"></script>
<script type="text/javascript" src="<%=root %>/js/extprototype.js"></script>	
<script type="text/javascript" src="<%=root %>/js/oz.js"></script>	
<script type="text/javascript" src="<%=root %>/js/alice.js"></script>
<script type="text/javascript">
var alice;
Event.observe(window, "load", function() {
	alice = Web.EditorManager.instance("editor",{type:'detail',width:'96%',height:'100%',limit:20,family:'妓崇',size:'13px'});

});	
</script>
<div class="py-5 text-center opaque-overlay"
	style="background-image: url(<%=root%>/img/etc/grass.jpg);">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-12 text-white">
				<h1 class="display-3"><%=gudanDto.getEnname() %></h1>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div id="current-category">
				<nav aria-label="breadcrumb" role="navigation">
					<ol class="breadcrumb justify-content-end"
						style="background-color: white;">
						<li class="breadcrumb-item"><i class="fa fa-home mr-2"
							aria-hidden="true"></i><a href="<%=root%>/gudan?act=viewgudan">姥舘</a></li>
						<li class="breadcrumb-item"><a href="<%=root%>/gudan?act=mvhome&tno=<%=gudanDto.getTno() %>"><%=gudanDto.getTname() %></a></li>
						<li class="breadcrumb-item active" aria-current="page">五昔</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<div id="gudan-nav">
	<div class="container">
		<div class="d-flex justify-content-center">
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvhome&tno=<%=gudanDto.getTno() %>">五昔</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvstadium&sno=<%=gudanDto.getSno1() %>">姥舌照鎧</a></div>
			<div class="gudan-nav-inner p-3"><a href="<%=root%>/gudan?act=mvweekly&tno=<%=gudanDto.getTno() %>">什追匝</a></div>
			<div class="gudan-nav-inner p-3"><a href="javascript:listArticle('<%=gudanDto.getTno()%>');">朕溝艦銅</a></div>
		</div>
		<div class="border-b p-0"></div>
	</div>
</div>

<div id="comm-best">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-8 py-5">

				<div class="">
					<h5>
						<strong>朕溝艦銅 呪舛馬奄</strong>
					</h5>
				</div>
				<div class="border-b-strong mb-5"></div>





				<form id="" class="">
					<div class="form-group row px-3">
						<label for="selectgudan" class="col-sm-2 col-4 col-form-label">姥舘</label>
						<div class="col-sm-4 col-8">
							<select id="selectgudan" class="form-control">
								<option selected>砧至 今嬢什</option>
								<option>茎汽 切戚情苧</option>
								<option>KIA 展戚暗綜</option>
								<option>NC 陥戚葛什</option>
								<option>SK 人戚腰什</option>
								<option>LG 闘制什</option>
								<option>学湿 備嬢稽綜</option>
								<option>廃鉢 戚越什</option>
								<option>誌失 虞戚紳綜</option>
								<option>KT 是綜</option>
							</select>
						</div>
					</div>

					<div class="form-group row px-3">
						<label for="writeName" class="col-sm-2 col-4 col-form-label">拙失切</label>
						<div class="col-sm-4 col-8">
							<input type="text" class="form-control" id="writeName"
								placeholder="漁疑寄" readonly>
						</div>
					</div>

					<div class="form-group row px-3">
						<label for="inputSubject" class="col-sm-2 col-12 col-form-label">薦鯉</label>
						<div class="col-sm-10 col-12">
							<input type="text" class="form-control" id="inputSubject"
								placeholder="呪舛吃越薦鯉">
						</div>
					</div>

					<div class="form-group row px-3">
						<div class="col-md-12">
							<textarea class="form-control" id="editor" name="editor" rows="20">呪舛吃越鎧遂</textarea>
						</div>
					</div>

					<!-- 歎採督析 -->
					<div class="form-group row px-3">
						<label for="inputfile" class="col-sm-2 col-form-label">歎採督析</label>
						<div class="col-sm-10">
							<input type="file" class="form-control-file mb-2"
								id="exampleFormControlFile1"> <label
								style="font-size: 14px;">戚耕走 滴奄澗 3MB戚馬稽 薦廃桔艦陥.(呪舛)</label>
								<br><label
								style="font-size: 14px; color: red;">越 呪舛獣 戚耕走澗 段奄鉢 桔艦陥.(?)</label>
							<!-- 訊照股備走..ばば
								<label class="custom-file">
								<input type="file" id="file2" class="custom-file-input mb-2"> <span
									class="custom-file-control"></span>
								</label> -->
						</div>
					</div>

					<!-- 銚鱈 -->
				</form>

				<div class="border-b mb-3"></div>
				<div class="d-flex">
					<div class="mr-auto p-2">
						<a class="btn btn-primary btn-sm" href="#" role="button"
							style="color: white !important;">鯉系左奄</a>
					</div>
					<div class="p-2">
						<a class="btn btn-secondary btn-sm" href="#" role="button"
							style="color: white !important;">昼社</a>
					</div>
					<div class="p-2">
						<a class="btn btn-primary btn-sm" href="#" role="button"
							style="color: white !important;">呪舛</a>
					</div>
				</div>





			</div>
			<!-- col-md-8 -->

			<div class="col-md-4 py-5">
				<h5>
					<strong>叔獣娃今什闘</strong>
				</h5>
				<div class="border-b-strong"></div>
				<ul class="list-group">
					<li class="list-group-item" style="border: none;"><span
						class="bestnum" style="color: red;">1</span> しさし級 析戚 戚係惟 朕遭...
						(157)</li>
					<li class="list-group-item"><span class="bestnum"
						style="color: red;">2</span> 馬馬馬馬馬 益君壱左艦 号添社... (65)</li>
					<li class="list-group-item"><span class="bestnum"
						style="color: red;">3</span> 馬馬馬馬馬 益君壱左艦 号添社... (65)</li>
					<li class="list-group-item"><span class="bestnum">4</span>
						馬馬馬馬馬 益君壱左艦 号添社... (65)</li>
					<li class="list-group-item"><span class="bestnum">5</span>
						馬馬馬馬馬 益君壱左艦 号添社... (65)</li>
					<li class="list-group-item" style="border: none;"><span
						class="bestnum">6</span> しさし級 析戚 戚係惟 朕遭... (157)</li>
					<li class="list-group-item"><span class="bestnum">7</span>
						馬馬馬馬馬 益君壱左艦 号添社... (65)</li>
					<li class="list-group-item"><span class="bestnum">8</span>
						馬馬馬馬馬 益君壱左艦 号添社... (65)</li>
					<li class="list-group-item"><span class="bestnum">9</span>
						馬馬馬馬馬 益君壱左艦 号添社... (65)</li>
					<li class="list-group-item"><span class="bestnum">10</span>
						馬馬馬馬馬 益君壱左艦 号... (65)</li>
				</ul>
			</div>

		</div>




	</div>
</div>


<!-- alice遂 footer慎蝕 -->
<%@ include file="/community/boardfooter.jsp"%>