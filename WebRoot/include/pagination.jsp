<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${page.total >= 20}">
	<div class="pageRow">
		<div class="table-footer" style="padding:3px;background: #fdfdfd">
			<div class="col-md-6">
				<div class="paginationInfo" style="font-size:12px;">
					每页显示
					<div class="btn-group dropup" style="margin-top: -3px;">
                      <button class="btn btn-xs">
                        ${page.size}
                      </button>
                      <button class="btn btn-xs dropdown-toggle" data-toggle="dropdown">
                        <span class="caret">
                        </span>
                      </button>
                      <ul class="dropdown-menu">
                      	<li class="${page.size == 20 ? 'sizeSelected' : '' }">
                          <a href="javascript:changePage(1,20)">20</a>
                        </li>
                        <li class="${page.size == 50 ? 'sizeSelected' : '' }">
                          <a href="javascript:changePage(1,50)">50</a>
                        </li>
                         <li class="${page.size == 100 ? 'sizeSelected' : '' }">
                          <a href="javascript:changePage(1,100)">100</a>
                        </li>
                         <li class="${page.size == 200 ? 'sizeSelected' : '' }">
                          <a href="javascript:changePage(1,200)">200</a>
                        </li>
                      </ul>
                    </div>
					条,总数&nbsp;<strong>${page.total}</strong>&nbsp;条,共&nbsp;<strong>${page.totalIndex }</strong>&nbsp;页
				</div>
			</div>
			<div class="col-md-6">
				<ul class="pagination">
					<!-- 何时禁用首页 -->
					<c:if test="${page.index == 1}">
						<li class="disabled">
							<a href="javascript:;"><i class="fa fa-angle-double-left"></i></a>
						</li>
						<li class="disabled">
							<a href="javascript:;"><i class="fa fa-angle-left"></i></a>
						</li>
					</c:if>
					<c:if test="${page.index > 1}">
						<li>
							<a href="javascript:;" onclick="changePage(1)"><i class="fa fa-angle-double-left"></i></a>
						</li>
						<li>
							<a href="javascript:;" onclick="changePage(${page.index - 1})"><i class="fa fa-angle-left"></i></a>
						</li>
					</c:if>

					<!-- 输出6页 -->
					<c:forEach var="i" begin="${page.beginIndex}"
						end="${page.endIndex }" step="1">
						<li class="${page.index == i ? 'active' : '' }"><a
							href="javascript:;" onclick="changePage(${i})">${i}</a></li>
					</c:forEach>

					<!-- 何时禁用末页 -->
					<c:if test="${page.index == page.endIndex}">
						<li class="disabled">
							<a href="javascript:;"><i class="fa fa-angle-right"></i></a>
						</li>
						<li class="disabled">
							<a href="javascript:;"><i class="fa fa-angle-double-right"></i></a>
						</li>
					</c:if>
					<c:if test="${page.index < page.endIndex}">
						<li>
							<a href="javascript:;" onclick="changePage(${page.index + 1})"><i class="fa fa-angle-right"></i></a>
						</li>
						<li>
							<a href="javascript:;" onclick="changePage(${page.totalIndex})"><i class="fa fa-angle-double-right"></i></a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</c:if>
