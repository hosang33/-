<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("UTF-8");
    	String path = request.getRequestURI();
    	
    %>
<div class="row">
		<div class="col-sm-12 text-center">
			<ul class="pagination">
			
			<li class="<%=pageNo > 1 ? "" : "disabled"%>"><a href="<%=path %>?pageno=<%=pageNo-1%>">&laquo;</a></li>
			
			<%
				for (int num =pagination.getBeginPage(); num<=pagination.getEndPage(); num++) {
			%>
				<li class="<%=pageNo == num ? "active" : ""%>"><a href="<%=path %>?pageno=<%=num%>"><%=num%></a></li>
			<%
				}
			%>
			<li class="<%=pageNo < pagination.getTotalPagesCount() ? "" : "disabled"%>"><a href="<%=path %>?pageno=<%=pageNo+1%>">&raquo;</a></li>
			</ul>
		</div>
	</div>