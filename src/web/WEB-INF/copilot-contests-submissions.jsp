<%--
  - Author: TCSDEVELOPER
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the list of Copilot Posting contests available to current user.
  - Since: TC Direct - Manage Copilot Postings assembly
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/taglibs.jsp" %>

<c:set var="PAGE_TYPE" value="copilot" scope="request"/>
<c:set var="CURRENT_TAB" value="copilotPostings" scope="request"/>
<c:set var="CURRENT_SUB_TAB" value="copilotContestSubmissions" scope="request"/>

<c:set var="copilotProfilesMap" value="${requestScope.copilotProfilesMap}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="includes/htmlhead.jsp"/>
    <link rel="stylesheet" href="/css/permissions.css?v=193435" media="all" type="text/css" />
    <script type="text/javascript" src="/scripts/permissions.js?v=210124"></script>
    <jsp:include page="includes/paginationSetup.jsp"/>
</head>

<body id="page">
<div id="wrapper">
    <div id="wrapperInner">
        <div id="container">
            <div id="content">

                <jsp:include page="includes/header.jsp"/>

                <div id="mainContent">

                    <jsp:include page="includes/right.jsp"/>

                    <div id="area1"><!-- the main area -->
                        <div class="area1Content">

                            <div class="currentPage">
                                <a href="${ctx}/dashboard" class="home">Dashboard</a> &gt;
                                <a href="<s:url action='launchCopilotContest' namespace='/copilot'/>">Copilots</a> &gt;
                                <strong>My Copilot Selection Contests</strong>
                            </div>
                            <!-- End .currentPage -->

                            <div id="copilotsIntroduction">
                                <div class="orderReview">

                                    <div class="myCopilotsContests">
                                        <span class="introductionHeadIcon">
                                            <img src="/images/copilot_contests_icon.png" alt="copilot contests"/></span>

                                        <h2 class="sectionHead"><c:out value="${viewData.contestStats.contest.title}"/></h2>
                                    </div>
                                    <!-- end .getCopilots -->

                                    <c:set value="${viewData.contestStats.contest.project.id}" var="tcDirectProjectId"/>
                                    <c:set value="${viewData.contestStats.contest.project.name}" var="tcDirectProjectName"/>
                                    <c:set value="${viewData.contestStats.contest.id}" var="projectId"/>
                                    <div class="myCopilotsContestsList">

                                        <jsp:include page="includes/copilot/contestStats.jsp"/>

                                        <div class="container2 tabs3Container tabs3Special"
                                             id="CopilotPostingSubmissions">

                                            <jsp:include page="includes/copilot/tabs.jsp"/>

                                            <div class="container2Left">
                                                <div class="container2Right"><div class="container2Bottom">
                                            <div class="container2BottomLeft"><div class="container2BottomRight">
                                                <div class="tableContainer">
                                                    <table class="projectStats newContestsStatus paginatedDataTable"
                                                           cellpadding="0" cellspacing="0">
                                                        <thead>
                                                            <tr>
                                                                <th>Copilot</th>
                                                                <th>Profiles</th>
                                                                <th>Submission Time</th>
                                                                <th>Download Submission</th>
                                                                <th>&nbsp;</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:set var="firstPlaceWinner" value="${viewData.copilotPostingWinner}"/>
                                                        <c:set var="secondPlaceWinner" value="${viewData.copilotPostingRunnerUp}"/>
                                                        <c:forEach items="${viewData.submissions}" var="submission"
                                                                   varStatus="loop">
                                                            <c:set var="submitter" value="${submission.submitter}"/>
                                                            <tr>
                                                                <td class="photo">
                                                                    <img src="/images/photo_people.png" alt="photo"/>
                                                                    <span><link:user userId="${submitter.id}" handle="${submitter.handle}"/> </span>
                                                                </td>
                                                                <td>
                                                                    <a rel="_blank"
                                                                       href="https://www.topcoder.com/tc?module=MemberProfile&amp;cr=${submitter.id}"
                                                                       class="memberProfile"><span class="profileLeft">Member Profile</span></a>
                                                                    <a rel="_blank"
                                                                       href="https://www.topcoder.com/tc?module=ViewCopilotProfile&amp;pid=${submitter.id}"
                                                                       class="copilotProfile"><span class="profileLeft">Copilot Profile</span></a>
                                                                    <!--this link should be replaced by Copilot Profile page-->
                                                                </td>
                                                                <td>
                                                                    <fmt:formatDate value="${submission.submissionDate}"
                                                                                    pattern="MM/dd/yyyy HH:mm"/>

                                                                </td>
                                                                <td>
                                                                    <link:onlineReviewDownloadSubmission
                                                                            projectId="${projectId}"
                                                                            submissionId="${submission.submissionId}"
                                                                            styleClass="downloadProfile">
                                                                        <span class="profileLeft">Download</span>
                                                                    </link:onlineReviewDownloadSubmission>
                                                                </td>

                                                                <td>
                                                                        <c:choose>
                                                                            <c:when test="${firstPlaceWinner eq null}">
                                                                                <a href="#" 
                                                                                   onclick="setCopilotSelection(${submission.submissionId},${copilotProfilesMap[submitter.id].id}, 1, ${tcDirectProjectId}, '${submitter.handle}', '${tcDirectProjectName}');"
                                                                                   class="chooseCopilotButton"><span
                                                                                    class="profileLeft">Choose This Copilot</span></a>
                                                                            </c:when>
                                                                            <c:when test="${submitter.id eq firstPlaceWinner.id}">
                                                                                The Chosen Copilot
                                                                            </c:when>
                                                                            <c:when test="${secondPlaceWinner eq null}">
                                                                                <a href="#" onclick="setCopilotSelection(${submission.submissionId},${copilotProfilesMap[submitter.id].id}, 2, ${tcDirectProjectId}, '${submitter.handle}', '${tcDirectProjectName}');"
                                                                                   class="chooseCopilotButton"><span
                                                                                    class="profileLeft">Choose as 2nd place</span></a>
                                                                            </c:when>
                                                                            <c:when test="${submitter.id eq secondPlaceWinner.id}">
                                                                                The Runner-Up Copilot
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                &nbsp;
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                        </tbody>
                                                    </table><!-- End .projectsStats -->
                                                </div>

                                                <div class="panel"></div>
                                            </div></div>
                                            </div></div></div>
                                        </div>
                                    </div>
                                    <!-- end .getCopilotsStep -->


                                </div>
                                <!-- end .orderReview -->


                            </div>
                            <!-- end #copilotsIntroduction -->

                            <!-- end #launchContestOut -->
                        </div>
                        <!-- End.area1Content -->
                    </div>
                    <!-- End #area1 -->

                </div>
                <!-- End #mainContent -->

                <jsp:include page="includes/footer.jsp"/>

            </div>
            <!-- End #content -->
        </div>
        <!-- End #container -->
    </div>
</div>
<!-- End #wrapper -->
<!-- this area will contain the popups of this page -->
<div class="popups">
</div>
<!-- End .popups -->
<jsp:include page="includes/popups.jsp"/>

<div class="dialogContent" style="display: none;">

    <div id="removeProjectDialog">

        <c:if test="${firstPlaceWinner eq null}">
            <div class="header">
                    <div class="title">Choose Copilot Confirmation</div>
                    <a class="dialogClose closeDialog" href="javascript:void(0);"></a>
            </div>

            <div class="body">
                Choose <strong id="firstPlaceCopilot"></strong> as copilot of project <strong id="projectNameLabel"></strong> ?
            </div>

            <div class="foot">
                <div class="separator"></div>
                <div class="buttons">
                    <a class="button6 chooseConfirmationButton selectWinnerCopilot" href="javascript:">
                        <span class="left"><span class="right">Yes</span></span></a>
                </div>
            </div>
        </c:if>


        <c:if test="${firstPlaceWinner ne null and secondPlaceWinner eq null}">
        <div class="header">
                <div class="title">Choose second place Confirmation</div>
                <a class="dialogClose closeDialog" href="javascript:void(0);"></a>
        </div>

        <div class="body">
            Choose <strong id="secondPlaceCopilot"></strong> as second place of this copilot posting ?
        </div>

        <div class="foot">
            <div class="separator"></div>
            <div class="buttons">
                <a class="button6 okeyButton chooseConfirmationButton selectRunnerUpCopilot" href="javascript:">
                    <span class="left"><span class="right">Yes</span></span></a>
            </div>
        </div>
        </c:if>
        <s:form action="selectCopilot" namespace="/copilot" method="post" id="SelectCopilotForm">
            <s:hidden name="projectId" value="%{#attr['projectId']}" id="scpProjectId"/>
            <s:hidden name="tcDirectProjectId" value="" id="scpTcdProjectId"/>
            <s:hidden name="placement" value="" id="scpPlacement"/>
            <s:hidden name="submissionId" value="" id="scpSubmissionId"/>
            <s:hidden name="profileId" value="" id="scpProfileId"/>
        </s:form>
    </div>

</div>

</body>
<!-- End #page -->
</html>
