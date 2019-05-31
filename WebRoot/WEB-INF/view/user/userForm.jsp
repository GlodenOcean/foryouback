<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="widget box">
	<div class="widget-header">
		<h4>
			<i class="fa fa fa-th-list"></i>用户信息
		</h4>
	</div>
	<div class="widget-content">
	    <!-- target="ajax" 表单将于ajax形式提交并返回json数据，框架会自动处理 -->
		<form id="addUserForm" class="form-horizontal row-border" action="user/update" target="ajax">
			<input type="hidden" name="user.id" value="${user.id }" />
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">用户名<span class="red">*</span></label>
						<div class="col-md-6">
							<c:if test="${user == null }">
								<input id="loginId" name="user.loginId" class="form-control" required="required"
									type="text" />
							</c:if>
							<c:if test="${user != null }">
								<input id="loginId" name="user.loginId" class="form-control"
									type="text" value="${user.loginId }" readonly="readonly" />
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">姓名<span class="red">*</span></label>
						<div class="col-md-6">
							<input id="userName" name="user.userName"
								value="${user.userName }" class="form-control" type="text">
						</div>
					</div>
				</div>
			</div>

			<c:if test="${user == null }">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label col-md-3">密码<span class="red">*</span></label>
							<div class="col-md-6">
								<input id="password" name="user.password" class="form-control"
									type="password">
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label col-md-3">确认密码<span
								class="red">*</span></label>
							<div class="col-md-6">
								<input id="cfmPassword" class="form-control" type="password">
							</div>
						</div>
					</div>
				</div>
			</c:if>

			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">角色</label>
						<div class="col-md-6">
							<select class="form-control" name="user.roleId">
								<option value="">无</option>
								<c:forEach items="${roleList }" var="role">
									<option value="${role.id }"
										${user.roleId == role.id ? 'selected' : '' }>${role.roleName }</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">所在地区</label>
						<div class="col-md-6">
							<select class="form-control">
								<option value="">Male</option>
								<option value="">Female</option>
							</select>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">所在部门</label>
						<div class="col-md-6">
							<input name="user.department" class="form-control"
								value="${user.department }" type="text">
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">使用有效期</label>
						<div class="col-md-6">
							<div class="radio-list">
								<c:choose>
									<c:when test="${user == null || user.useType == '0' }">
										<label class="radio-inline"> <input type="radio"
											name="user.useType" value="0" checked="checked">长期
										</label>
										<label class="radio-inline"> <input type="radio"
											name="user.useType" value="1">临时
										</label>
									</c:when>
									<c:otherwise>
										<label class="radio-inline"> <input type="radio"
											name="user.useType" value="0">长期
										</label>
										<label class="radio-inline"> <input type="radio"
											name="user.useType" value="1" checked="checked">临时
										</label>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">有效开始日期</label>
						<div class="col-md-6">
							<input name="user.startDate"
								value="${user.startDate }" class="form-control date-picker" type="text"
								readonly="readonly">
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">有效截止日期</label>
						<div class="col-md-6">
							<input name="user.endDate" value="${user.endDate }"
								class="form-control date-picker" type="text" readonly="readonly">
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-md-3">状态</label>
						<div class="col-md-6">
							<div class="radio-list">

								<c:choose>
									<c:when test="${user == null || user.status == '1' }">
										<label class="radio-inline"> <input type="radio"
											name="user.status" value="1" checked="checked">启用
										</label>
										<label class="radio-inline"> <input type="radio"
											name="user.status" value="0">禁用
										</label>
									</c:when>
									<c:otherwise>
										<label class="radio-inline"> <input type="radio"
											name="user.status" value="1">启用
										</label>
										<label class="radio-inline"> <input type="radio"
											name="user.status" value="0" checked="checked">禁用
										</label>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="widget-footer">
		<a href="javascript:;" class="btn" target="closeTab">关闭</a>&emsp;
		<button type="button" class="btn btn-success" onclick="addUser()">确定</button>
	</div>
</div>
<script>

	function validate() {
		var loginId = {
			senderId : "loginId",
			ruler : {
				require : true,
				maxLength : 20,
				startWithLetter : true
			}
		};
		var userName = {
			senderId : "userName",
			ruler : {
				require : true
			}
		};
		var password = {
			senderId : "password",
			ruler : {
				require : true,
				maxLength : 16,
				minLength : 6
			}
		};
		var cfmPassword = {
			senderId : "cfmPassword",
			ruler : {
				require : true
			}
		};
		var array;
		var pwd = $("#password");
		if (pwd.val()) {
			array = [ loginId, userName, password, cfmPassword ];
		} else {
			array = [ loginId, userName ];
		}

		var isCheck = $ES.validate(array);

		if (isCheck) {
			if (pwd.val()) {
				var passwordInput = $("#password");
				var cfmPasswordInput = $("#cfmPassword");
				if (passwordInput.val() != cfmPasswordInput.val()) {
					showError(cfmPasswordInput, "确认密码不一致");
					return false;
				} else {
					return true;
				}
			} else {
				return isCheck;
			}
		}
		return isCheck;
	}

	function addUser() {
		var isCheck = validate();
		if (isCheck) {
			$("#addUserForm").submit();
		}
	}
</script>