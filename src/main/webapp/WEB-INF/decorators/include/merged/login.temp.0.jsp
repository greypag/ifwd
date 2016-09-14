<%--<div class="dropdown-menu drop-width">
    <form name="loginform" id="loginform" method="post">
        <div class="login-form">
            <div
                style="display: none; position: fixed; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
                class="login-ajax-loading">
                <img
                    style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-top: -50px; margin-left: -50px;"
                    src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
            </div>
            <div id="login-err-msg" class="alert alert-danger"
                role="alert" style="display: none;"></div>
            <div class="form-container" >
                <h2>
                    <fmt:message key="header.login.heading" bundle="${msg}" />
                </h2>
                <h4 class="margin-shift">
                    <fmt:message key="header.login.username" bundle="${msg}" />
                    <a
                        href="${pageContext.request.contextPath}/${language}/forgotUserName"
                        class="pull-right sub-link"><fmt:message
                            key="header.login.username.forget" bundle="${msg}" /></a>
                </h4>

                <div class="form-group">
                    <input type="text" name="userName" class="form-control"
                        placeholder="" id="headerUserName">
                </div>
                <span id="errUserName" style="color: red"></span>
                <h4 class="margin-shift">
                    <fmt:message key="header.login.password" bundle="${msg}" />
                    <a
                        href="${pageContext.request.contextPath}/${language}/forgotPassword"
                        class="pull-right sub-link"><fmt:message
                            key="header.login.password.forget" bundle="${msg}" /></a>
                </h4>
                <div class="form-group">
                    <input type="password" name="password" class="form-control"
                        autocomplete="off" id="headerPassword">
                </div>
                <span id="errPass" style="color: red"></span> <br>
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <button type="button"
                            onclick="submitLoginForm('loginform');"
                            class="bdr-curve btn btn-primary btn-lg wd5">
                            <fmt:message key="header.login.action" bundle="${msg}" />
                        </button>
                    </div>
                    <h3
                        class="text-left col-lg-6 col-md-6 pad-0 margin-0">
                        <span> <fmt:message
                                key="header.login.registration.heading" bundle="${msg}" /></span><br>
                        <a
                            href="${pageContext.request.contextPath}/${language}/joinus">
                            <fmt:message key="header.login.registration.action"
                                bundle="${msg}" />
                        </a>
                    </h3>
                    <div class="clearfix"></div>
                </div>
                <p>
                    <fmt:message key="header.login.disclaimer" bundle="${msg}" />
                </p>
            </div>
        </div>
    </form>
</div> --%>
