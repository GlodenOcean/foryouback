<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:forEach items="${defaultParameterList }" var="parm">
	<div class="row">
		<div class="col-md-12">
				<label class="col-md-3 control-label">${parm.name }</label>
				<div class="col-md-4">
					<c:forEach items="${luaCompareCharList }" var="luaChar">
						<c:if test="${parm.compareChar == luaChar.key }">
							<input class="form-control" type="text" value="${luaChar.value}" readonly="readonly">
						</c:if>
					</c:forEach>
				</div>	
				<div class="col-md-4">
					<input class="form-control" type="text" value="${parm.value }" readonly="readonly">
				</div>
		</div>
		
	</div>
</c:forEach>
<br/>
<div style="border-top:1px solid #dedede;">
<div class="row">
		<div class="col-md-12">
				<label class="col-md-3 control-label" style="color:#95acff">配置参数</label>
		</div>
</div>
<c:forEach items="${dbParameterList }" var="parm" varStatus="status">
	<div class="row">
		<div class="col-md-12">
				<input type="hidden" value="${parm.name }" name="link.itemName${status.index+1 }" />
				<label class="col-md-3 control-label">${parm.name }</label>
				<div class="col-md-4">
					<c:forEach items="${luaCompareCharList }" var="luaChar">
						<c:if test="${parm.compareChar == luaChar.key }">
							<input class="form-control" type="text" value="${luaChar.value}" readonly="readonly">
						</c:if>
					</c:forEach>
				</div>	
				<div class="col-md-4">
					<input name="link.itemValue${status.index+1}" class="form-control" type="text" value="${parm.value }">
				</div>
		</div>
	</div>
</c:forEach>
<br/>
</div>

				
