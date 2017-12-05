<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.baseball.auction.model.AuctionDetailDto,java.util.List"%>
<!--header 영역 -->
<%@ include file="/common/header.jsp"%>


<%
	List<AuctionDetailDto> bestList = (List<AuctionDetailDto>)request.getAttribute("bestList");
	List<AuctionDetailDto> endList = (List<AuctionDetailDto>)request.getAttribute("endList");
	List<AuctionDetailDto> hitList = (List<AuctionDetailDto>)request.getAttribute("hitList");
	List<AuctionDetailDto> newList = (List<AuctionDetailDto>)request.getAttribute("newList");
	String list = request.getParameter("list");
%>
<script type="text/javascript">
function mainList(){
	document.location.href = "<%=root%>/auctionlist?act=mainlist";
}

if(<%=bestList%> == null && <%=endList%> == null && <%=hitList%> == null && <%=newList%> == null)
{
	window.onload = function() {
		mainList();
	}
}
</script>

<form action="" name="auctionListForm" method="get" >
<div class="container py-5 my-5">
	<div class="navbar-template text-center"></div>
</div>

<div id="auction-maincarousel">
   <div class="container-fluid">
      <div class="row p-5">
         <div class="align-self-center p-0 col-md-3">

            <ul class="list-group">
               <li
                  class="list-group-item d-flex justify-content-between align-items-center">
                  전체보기 <span class="badge badge-primary badge-pill">14</span>
               </li>
               <li
                  class="list-group-item d-flex justify-content-between align-items-center">
                  유니폼 <span class="badge badge-primary badge-pill">2</span>
               </li>
               <li
                  class="list-group-item d-flex justify-content-between align-items-center">
                  경기용품 <span class="badge badge-primary badge-pill">1</span>
               </li>
               <li
                  class="list-group-item d-flex justify-content-between align-items-center">
                  응원용품 <span class="badge badge-primary badge-pill">1</span>
               </li>
               <li
                  class="list-group-item d-flex justify-content-between align-items-center">
                  기타잡화 <span class="badge badge-primary badge-pill">1</span>
               </li>
               <li
                  class="bg-pingendo list-group-item d-flex justify-content-between align-items-center">
                  <span class="text-center" style="color: white; width:100%;">내물품 등록하기</span>
               </li>
            </ul>
         </div>
         
         <!-- 이미지크기 꽉차게 맞춰야함..ㅠㅠㅠㅠ atl노란오류는 무시ㄱㄱ-->
         <div class="col-md-9 p-0">
            <div id="carousel1" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner" role="listbox">
                  <div class="carousel-item">
                     <img src="<%=root%>/img/auction/carousel/auction-carousel1.jpg" atl="first slide" style="max-height: 391px;" class="d-block img-fluid w-100">
                  </div>
                  <div class="carousel-item">
                     <img class="d-block img-fluid w-100"
                        src="<%=root%>/img/auction/carousel/auction-carousel1.jpg"
                        data-holder-rendered="true"
                        style="max-height: 391px;">
                  </div>
                  <div class="carousel-item active">
                     <img class="d-block img-fluid w-100"
                        src="<%=root%>/img/auction/carousel/auction-carousel2.jpg"
                        style="max-height: 391px;" data-holder-rendered="true">
                  </div>
               </div>
               <a class="carousel-control-prev" href="#carousel1" role="button"
                  data-slide="prev"> <span class="carousel-control-prev-icon"
                  aria-hidden="true"></span> <span class="sr-only">Previous</span>
               </a> <a class="carousel-control-next" href="#carousel1" role="button"
                  data-slide="next"> <span class="carousel-control-next-icon"
                  aria-hidden="true"></span> <span class="sr-only">Next</span>
               </a>
            </div>
         </div>
      </div>
   </div>
</div>



<!--
<!-- 추천별 경매물품 섹션: best pick: 관리자가 초이스한 상품들 -->
<div id="auc-recommended" class="py-5">


<div class="container py-5">
	<!-- Nav tabs -->
	<ul class="nav nav-tabs nav-justified" role="tablist">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#menu1">BEST PICK</a></li>
		<li class="nav-item"><a class="nav-link"  data-toggle="tab"
			href="#menu2"">마감임박</a></li>
		<li class="nav-item"><a class="nav-link"  data-toggle="tab"
			href="#menu3">인기물품</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#menu4"">신규물품</a></li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<div id="menu1" class="container tab-pane active">
		<div class="row p-2 text-center">
<% 
int size = 0;
if(bestList != null)
{
	size = bestList.size();
	for(int i=0; i<size; i++)
	{
%>				
			
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/<%=bestList.get(i).getAimage()%>" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong><%=bestList.get(i).getAname()%></strong><br>
								입찰자수 : <%=bestList.get(i).getBidNum()%>명<br>남은시간 : 5일 3시간 20분
							</p>
							<p style="color: red;">
								<strong>현재입찰가 : <%=bestList.get(i).getBidPrice()%></strong>
							</p>
						</div>
					</div>
				</div>
<%
	}
}
%>

			</div>
		</div>
<!--  -->
		<div id="menu2" class="container tab-pane fade">
						<div class="row p-2 text-center">
<% 
size = 0;
if(endList != null)
{
	size = endList.size();
	for(int i=0; i<size; i++)
	{
%>		
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">				
							<img src="<%=root%>/<%=endList.get(i).getAimage()%>" class="img-fluid">												
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong><%=endList.get(i).getAname()%></strong><br>
								입찰자수 :<%=endList.get(i).getBidNum()%>명<br>
								남은시간 : 3일 2시간 20분
							</p>
							<p style="color: red;">
								<strong>현재입찰가 : <%=endList.get(i).getBidPrice()%></strong>
							</p>
						</div>
					</div>
				</div>
<%
	}
}
%>
			</div>
		</div>

		<div id="menu3" class="container tab-pane fade">
						<div class="row p-2 text-center">
<% 
size = 0;
if(hitList != null)
{
	size = hitList.size();
	for(int i=0; i<size; i++)
	{
%>		
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/<%=hitList.get(i).getAimage()%>" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong><%=hitList.get(i).getAname()%></strong><br>입찰자수 :<%=hitList.get(i).getBidNum()%>명<br>
								남은시간 : 5일 3시간 20분
							</p>
							<p style="color: red;">
								<strong>현재입찰가 : <%=hitList.get(i).getBidPrice()%></strong>
							</p>
						</div>
					</div>
				</div>
<%
	}
}
%>
			</div>
		</div>

		<div id="menu4" class="container tab-pane fade">
			<div class="row p-2 text-center">
<% 
size = 0;
if(newList != null)
{
	size = newList.size();
	for(int i=0; i<size; i++)
	{
%>		
				<div class="col-md-3">
					<div class="row p-2">
						<div class="col-md-12 col-4 align-self-center">
							<img src="<%=root%>/<%=newList.get(i).getAimage()%>" class="img-fluid">
						</div>
						<div class="col-md-12 col-8 align-self-center">
							<p class="mb-2">
								<strong><%=newList.get(i).getAname()%></strong><br>입찰자수 : <%=newList.get(i).getBidNum()%>명<br>남은시간 : 4일 3시간 20분
							</p>
							<p style="color: red;">
								<strong>현재입찰가 : <%=newList.get(i).getBidPrice()%>원</strong>
							</p>
						</div>
					</div>
				</div>
<% 
	}
}
%>				
				</div>	
			</div>
		</div>
	</div>
</div>

<div class="">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 col-6 p-0">
				<div id="image-overlay"></div>
				<div>
					<img src="<%=root%>/img/auction/auction-hanwha.jpg" class="img-fluid">
				</div>
			</div>
			<div class="p-0 col-md-3 col-6" style="">
				<img src="<%=root%>/img/auction/auction-doosan.jpg" class="img-fluid">
				<div class="carousel-caption">두산 베어스</div>
			</div>
			<div class="col-md-3 col-6 p-0" style="background-color: #777777;"></div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-kia.jpg" class="img-fluid"
					style="overflow: hidden">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-lotte.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0" style="background-color: #777777;"></div>
			<div class="p-0 col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-samsung.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-kt.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-nexen.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-nc.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-sk.jpg" class="img-fluid">
			</div>
			<div class="col-md-3 col-6 p-0">
				<img src="<%=root%>/img/auction/auction-lg.jpg" class="img-fluid">
			</div>
		</div>
	</div>
</div>

<!-- 구단별 로고 >> 링크 구단페이지로 -->
<div class="py-5" style="background-color: #3452FF;">
	<div class="container text-center">
		<div class="row">
			<div class="col-md-12 col-12">
				<a class="text-white" href="#">한화 이글스</a> <span
					class="border-r mx-2" style="border-color: white;"></span> <a
					class="text-white" href="#">두산 베어스</a> <span class="border-r mx-2"
					style="border-color: white;"></span> <a class="text-white" href="#">KIA
					타이거즈</a> <span class="border-r mx-2" style="border-color: white;"></span>
				<a class="text-white" href="#">롯데 자이언츠</a> <span
					class="border-r mx-2" style="border-color: white;"></span> <a
					class="text-white" href="#">삼성 라이온즈</a> <span class="border-r mx-2"
					style="border-color: white;"></span> <a class="text-white" href="#">KT
					위즈</a> <span class="border-r mx-2" style="border-color: white;"></span>
				<a class="text-white" href="#">넥센 히어로즈</a> <span
					class="border-r mx-2" style="border-color: white;"></span> <a
					class="text-white" href="#">NC 다이노스</a> <span class="border-r mx-2"
					style="border-color: white;"></span> <a class="text-white" href="#">SK
					와이번스</a> <span class="border-r mx-2" style="border-color: white;"></span>
				<a class="text-white" href="#">LG 트윈스</a>
			</div>
		</div>
	</div>
</div>
</form>

<!-- footer영역 -->
<%@ include file="/common/footer.jsp"%>