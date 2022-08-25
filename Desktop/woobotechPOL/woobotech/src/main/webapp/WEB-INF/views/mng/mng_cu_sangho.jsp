<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<table id="tablebody3" width="100%"
	class="stripe row-border order-column" cellspacing="0">
	<thead>
		<tr>
			<th><input type="checkbox" name="chk_info" value=""></th>
			<th>Partner number</th>
			<th>Name of partner</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${ board.size() > 0 }">
				<c:forEach var="vo" items="${ board }">
					<tr>
						<td><input type="checkbox" name="box" value="${vo.cno}"></td>
						<td><span class='d_cno'>${vo.cno}</span></td>
						<td><span class='d_cu_sangho'>${ vo.cu_sangho}</span></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3" style="height: 100px; text-align: center;">No data found.</td>
				</tr>
			</c:otherwise>

		</c:choose>
	</tbody>
</table>

