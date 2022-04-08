<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<time class="reply_item_footer_time">
	<jsp:useBean id="today" class="java.util.Date" />
	<fmt:formatDate value="${today }" var="now" pattern="yyyyMMddHHmm"/>
	<fmt:parseDate value="${reply.write_date }" var="write_date" pattern="yyyy-MM-dd HH:mm:ss"/>
	<fmt:formatDate value="${write_date }" var="w_date" pattern="yyyyMMddHHmm"/>
		<c:if test="${now-w_date > 10000 && now-w_date < 20000}">
			1일 전
		</c:if>
		<c:if test="${now-w_date >= 20000 && now-w_date < 30000}">
			2일 전
		</c:if>
		<c:if test="${now-w_date >= 30000 && now-w_date < 40000}">
			3일 전
		</c:if>
		<c:if test="${now-w_date >= 40000 && now-w_date < 50000}">
			4일 전
		</c:if>
		<c:if test="${now-w_date >= 50000 && now-w_date < 60000}">
			5일 전
		</c:if>
		<c:if test="${now-w_date >= 60000 && now-w_date < 70000}">
			6일 전
		</c:if>
		<c:if test="${now-w_date >= 70000 && now-w_date < 140000}">
			1주 전
		</c:if>
		<c:if test="${now-w_date == 140000 && now-w_date < 210000}">
			2주 전
		</c:if>
		<c:if test="${now-w_date == 210000 && now-w_date < 280000}">
			3주 전
		</c:if>
		<c:if test="${now-w_date == 280000 && now-w_date < 1000000}">
			1개월 전
		</c:if>
		<c:if test="${now-w_date == 1000000 && now-w_date < 2000000 }">
			1개월 전
		</c:if>
		<c:if test="${now-w_date >= 2000000 && now-w_date < 3000000}">
			2개월 전
		</c:if>
		<c:if test="${now-w_date >= 3000000 && now-w_date < 4000000}">
			3개월 전
		</c:if>
		<c:if test="${now-w_date >= 4000000 && now-w_date < 5000000}">
			4개월 전
		</c:if>
		<c:if test="${now-w_date >= 5000000 && now-w_date < 6000000}">
			5개월 전
		</c:if>
		<c:if test="${now-w_date >= 6000000 && now-w_date < 7000000}">
			6개월 전
		</c:if>
		<c:if test="${now-w_date >= 7000000 && now-w_date < 8000000}">
			7개월 전
		</c:if>
		<c:if test="${now-w_date >= 8000000 && now-w_date < 9000000}">
			8개월 전
		</c:if>
		<c:if test="${now-w_date >= 9000000 && now-w_date < 10000000}">
			9개월 전
		</c:if>
		<c:if test="${now-w_date >= 10000000 && now-w_date < 11000000}">
			10개월 전
		</c:if>
		<c:if test="${now-w_date >= 11000000 && now-w_date < 12000000}">
			11개월 전
		</c:if>
		<c:if test="${now-w_date >= 12000000 && now-w_date < 100000000}">
			1년 전
		</c:if>
		<c:if test="${now-w_date == 100000000 && now-w_date < 200000000}">
			1년 전
		</c:if>
		<c:if test="${now-w_date == 200000000 && now-w_date < 300000000}">
			2년 전
		</c:if>
		<c:if test="${now-w_date == 300000000 && now-w_date < 400000000}">
			3년 전
		</c:if>
		<c:if test="${now-w_date == 10000 && now-w_date > 2400 }">
			24시간 전
		</c:if>
		<c:if test="${now-w_date == 2400 && now-w_date > 2300}">
			24시간 전
		</c:if>
		<c:if test="${now-w_date <= 2300 && now-w_date > 2200}">
			23시간 전
		</c:if>
		<c:if test="${now-w_date <= 2200 && now-w_date > 2100}">
			22시간 전
		</c:if>
		<c:if test="${now-w_date <= 2100 && now-w_date > 2000}">
			21시간 전
		</c:if>
		<c:if test="${now-w_date <= 2000 && now-w_date > 1900}">
			20시간 전
		</c:if>
		<c:if test="${now-w_date <= 1900 && now-w_date > 1800}">
			19시간 전
		</c:if>
		<c:if test="${now-w_date <= 1800 && now-w_date > 1700}">
			18시간 전
		</c:if>
		<c:if test="${now-w_date <= 1700 && now-w_date > 1600}">
			17시간 전
		</c:if>
		<c:if test="${now-w_date <= 1600 && now-w_date > 1500}">
			16시간 전
		</c:if>
		<c:if test="${now-w_date <= 1500 && now-w_date > 1400}">
			15시간 전
		</c:if>
		<c:if test="${now-w_date <= 1400 && now-w_date > 1300}">
			14시간 전
		</c:if>
		<c:if test="${now-w_date <= 1300 && now-w_date > 1200}">
			13시간 전
		</c:if>
		<c:if test="${now-w_date <= 1200 && now-w_date > 1100}">
			12시간 전
		</c:if>
		<c:if test="${now-w_date <= 1100 && now-w_date > 1000}">
			11시간 전
		</c:if>
		<c:if test="${now-w_date <= 1000 && now-w_date > 900}">
			10시간 전
		</c:if>
		<c:if test="${now-w_date <= 900 && now-w_date > 800}">
			9시간 전
		</c:if>
		<c:if test="${now-w_date <= 800 && now-w_date > 700}">
			8시간 전
		</c:if>
		<c:if test="${now-w_date <= 700 && now-w_date > 600}">
			7시간 전
		</c:if>
		<c:if test="${now-w_date <= 600 && now-w_date > 500}">
			6시간 전
		</c:if>
		<c:if test="${now-w_date <= 500 && now-w_date > 400}">
			5시간 전
		</c:if>
		<c:if test="${now-w_date <= 400 && now-w_date > 300}">
			4시간 전
		</c:if>
		<c:if test="${now-w_date <= 300 && now-w_date > 200}">
			3시간 전
		</c:if>
		<c:if test="${now-w_date <= 200 && now-w_date > 100}">
			2시간 전
		</c:if>
		<c:if test="${now-w_date == 100}">
			1시간 전
		</c:if>
		<c:if test="${now-w_date == 60}">
			1시간 전
		</c:if>
		<c:if test="${now-w_date == 59}">
			59분 전
		</c:if>
		<c:if test="${now-w_date == 58}">
			58분 전
		</c:if>
		<c:if test="${now-w_date == 57}">
			57분 전
		</c:if>
		<c:if test="${now-w_date == 56}">
			56분 전
		</c:if>
		<c:if test="${now-w_date == 55}">
			55분 전
		</c:if>
		<c:if test="${now-w_date == 54}">
			54분 전
		</c:if>
		<c:if test="${now-w_date == 53}">
			53분 전
		</c:if>
		<c:if test="${now-w_date == 52}">
			52분 전
		</c:if>
		<c:if test="${now-w_date == 51}">
			51분 전
		</c:if>
		<c:if test="${now-w_date == 50}">
			50분 전
		</c:if>
		<c:if test="${now-w_date == 49}">
			49분 전
		</c:if>
		<c:if test="${now-w_date == 48}">
			48분 전
		</c:if>
		<c:if test="${now-w_date == 47}">
			47분 전
		</c:if>
		<c:if test="${now-w_date == 46}">
			46분 전
		</c:if>
		<c:if test="${now-w_date == 45}">
			45분 전
		</c:if>
		<c:if test="${now-w_date == 44}">
			44분 전
		</c:if>
		<c:if test="${now-w_date == 43}">
			43분 전
		</c:if>
		<c:if test="${now-w_date == 42}">
			42분 전
		</c:if>
		<c:if test="${now-w_date == 41}">
			41분 전
		</c:if>
		<c:if test="${now-w_date == 40}">
			40분 전
		</c:if>
		<c:if test="${now-w_date == 39}">
			39분 전
		</c:if>
		<c:if test="${now-w_date == 38}">
			38분 전
		</c:if>
		<c:if test="${now-w_date == 37}">
			37분 전
		</c:if>
		<c:if test="${now-w_date == 36}">
			36분 전
		</c:if>
		<c:if test="${now-w_date == 35}">
			35분 전
		</c:if>
		<c:if test="${now-w_date == 34}">
			34분 전
		</c:if>
		<c:if test="${now-w_date == 33}">
			33분 전
		</c:if>
		<c:if test="${now-w_date == 32}">
			32분 전
		</c:if>
		<c:if test="${now-w_date == 31}">
			31분 전
		</c:if>
		<c:if test="${now-w_date == 30}">
			30분 전
		</c:if>
		<c:if test="${now-w_date == 29}">
			29분 전
		</c:if>
		<c:if test="${now-w_date == 28}">
			28분 전
		</c:if>
		<c:if test="${now-w_date == 27}">
			27분 전
		</c:if>
		<c:if test="${now-w_date == 26}">
			26분 전
		</c:if>
		<c:if test="${now-w_date == 25}">
			25분 전
		</c:if>
		<c:if test="${now-w_date == 24}">
			24분 전
		</c:if>
		<c:if test="${now-w_date == 23}">
			23분 전
		</c:if>
		<c:if test="${now-w_date == 22}">
			22분 전
		</c:if>
		<c:if test="${now-w_date == 21}">
			21분 전
		</c:if>
		<c:if test="${now-w_date == 20}">
			20분 전
		</c:if>
		<c:if test="${now-w_date == 19}">
			19분 전
		</c:if>
		<c:if test="${now-w_date == 18}">
			18분 전
		</c:if>
		<c:if test="${now-w_date == 17}">
			17분 전
		</c:if>
		<c:if test="${now-w_date == 16}">
			16분 전
		</c:if>
		<c:if test="${now-w_date == 15}">
			15분 전
		</c:if>
		<c:if test="${now-w_date == 14}">
			14분 전
		</c:if>
		<c:if test="${now-w_date == 13}">
			13분 전
		</c:if>
		<c:if test="${now-w_date == 12}">
			12분 전
		</c:if>
		<c:if test="${now-w_date == 11}">
			11분 전
		</c:if>
		<c:if test="${now-w_date == 10}">
			10분 전
		</c:if>
		<c:if test="${now-w_date == 9}">
			9분 전
		</c:if>
		<c:if test="${now-w_date == 8}">
			8분 전
		</c:if>
		<c:if test="${now-w_date == 7}">
			7분 전
		</c:if>
		<c:if test="${now-w_date == 6}">
			6분 전
		</c:if>
		<c:if test="${now-w_date == 5}">
			5분 전
		</c:if>
		<c:if test="${now-w_date == 4}">
			4분 전
		</c:if>
		<c:if test="${now-w_date == 3}">
			3분 전
		</c:if>
		<c:if test="${now-w_date == 2}">
			2분 전
		</c:if>
		<c:if test="${now-w_date == 1}">
			1분 전
		</c:if>
		<c:if test="${now-w_date == 0}">
			방금 전
		</c:if>
	</time>