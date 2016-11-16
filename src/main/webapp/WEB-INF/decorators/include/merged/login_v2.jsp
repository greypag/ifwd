<div class="collapse navbar-collapse navbar-right top-menu pad-0" id="headerLoginForm">
    <ul class="nav navbar-nav top-menu__navbar">
        <li class="active top-menu__navbar__item"><a
            href="<%=request.getContextPath()%>/${language}"><fmt:message
                    key="header.menu.home" bundle="${msg}" /></a></li>
        <li class="top-menu__navbar__item"><a
            href="<fmt:message key="header.menu.about.link" bundle="${msg}" />"
            target="_blank"><fmt:message key="header.menu.about"
                    bundle="${msg}" /></a></li>
        <li class="active top-menu__navbar__item"><a
            href="<fmt:message key="header.menu.contactus.link" bundle="${msg}" />"
            target="_blank"><fmt:message key="header.menu.contactus"
                    bundle="${msg}" /></a></li></li>
        <%
            //System.out.println("username " + username);
            if (username == null) {
        %>
        <li class="top-menu__navbar__item"><a
            href="${pageContext.request.contextPath}/${language}/joinus"><fmt:message
                    key="header.menu.join" bundle="${msg}" /></a></li>
        <%
            } else if (username.equals("*DIRECTGI")) {
        %>
        <li class="top-menu__navbar__item"><a
            href="${pageContext.request.contextPath}/${language}/joinus"><fmt:message
                    key="header.menu.join" bundle="${msg}" /></a></li>

        <%
            }
        %>
        <%
            if (session.getAttribute("authenticate") == null
                    || session.getAttribute("username") == null) {
        %>

        <li class="top-menu__navbar__item top-menu__navbar__item--login-btn dropdown margin-left1 js-not-logged-in" id="myDropdown">
            <a href="#" data-toggle="modal" data-target="#loginpopup">
                <fmt:message key="header.menu.login" bundle="${msg}" />
                <i class="fa fa-caret-right"></i>
            </a>
            <%-- JSP commented before, refer to header_v2.temp.1.jsp --%>


        </li>
        
        <li class="dropdown logout-btn margin-left1 top-menu__navbar__item js-logged-in hidden" id="myDropdown">
            <a class="js-myDropdown__userName" href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message
                    key="header.login.welcome" bundle="${msg}" />&nbsp;&nbsp;&nbsp;
                <i class="fa fa-caret-right"></i> </a>
            <div class="dropdown-menu drop-width">
                <ul>
                    <li><a
                        href="<%=request.getContextPath()%>/${language}/account"
                        class="color1"> <fmt:message key="header.menu.member"
                                bundle="${msg}" /></a></li>
                    <li><a href="<%=request.getContextPath()%>/userLogout"
                        class="color1"> <fmt:message key="header.menu.logout"
                                bundle="${msg}" />


                    </a></li>
                </ul>
            </div>
        </li>        
        <%
            } else if (!"true".equals(session.getAttribute("authenticate")
                    .toString())) {
        %>
        <li class="dropdown login-btn margin-left1 top-menu__navbar__item top-menu__navbar__item--login-btn" id="myDropdown">
            <a href="#" data-toggle="modal" data-target="#loginpopup"><fmt:message
                    key="header.menu.login" bundle="${msg}" /> <i
                class="fa fa-caret-right"></i> </a>
            <div class="dropdown-menu drop-width">
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
                        <div class="form-container">
                            <h2>
                                <fmt:message key="header.login.heading" bundle="${msg}" />
                            </h2>
                            <h4>
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
                            <h4>
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
            </div>
        </li>
        <%
            } else {
        %>
        <li class="dropdown logout-btn margin-left1 top-menu__navbar__item" id="myDropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message
                    key="header.login.welcome" bundle="${msg}" />&nbsp;&nbsp;&nbsp;<%=session.getAttribute("username")%>
                <i class="fa fa-caret-right"></i> </a>
            <div class="dropdown-menu drop-width">
                <ul>
                    <%
                        if (!"direct".equalsIgnoreCase(request.getSession()
                                    .getAttribute("authenticate").toString())) {
                    %>
                    <li><a
                        href="<%=request.getContextPath()%>/${language}/account"
                        class="color1"> <fmt:message key="header.menu.member"
                                bundle="${msg}" /></a></li>
                    <%
                        }
                    %>
                    <li><a href="<%=request.getContextPath()%>/userLogout"
                        class="color1"> <fmt:message key="header.menu.logout"
                                bundle="${msg}" />


                    </a></li>
                </ul>
            </div>
        </li>
        <%
            }
        %>

        <li class="top-menu__navbar__item top-menu__navbar__item--chatnow-btn"><a
            href="<fmt:message key="fwd.homepage.link" bundle="${msg}" />" target="_blank"><fmt:message
                    key="header.menu.chatnow" bundle="${msg}" /></a></li>
    </ul>
</div>
