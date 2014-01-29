<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />
<h1>Demo for sending events</h1>
<p>This portlet's action handler sends two events, 
   <strong>{http://liferay.com/issue}/demo1</strong> and
   <strong>{http://liferay.com/issue}/demo2</strong>. The payload for both
   is a random number. The last sent values are displayed here. 
   Both values are expected to be received by ReceiverPortlet.
</p>
<portlet:actionURL name="send" var="send"/>
<p>Send both events: <a href="<%=send%>">click here</a></p>

<% String lastPayload1 = renderRequest.getParameter("lastPayload1");
if(lastPayload1 != null) { %>
  <p>Last payload sent with demo1: <%=lastPayload1%></p>
<% } %>

<% String lastPayload2 = renderRequest.getParameter("lastPayload2");
if(lastPayload2 != null) { %>
  <p>Last payload sent with demo2: <%=lastPayload2%></p>
<% } %>
