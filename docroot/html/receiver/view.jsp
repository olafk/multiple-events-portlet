<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />
<h1>Demo for receiving events</h1>
<p>
	Expected outcome: This portlet handles incoming events, named 
	<strong>{http://liferay.com/issue}/demo</strong> and
	<strong>{http://liferay.com/issue}/demo2</strong>. During eventhandling
	it prints the payload to System.out and stores them in a renderParameter
	(see ReceiverPortlet eventhandlers)
</p>
<p>
This portlet is expected to display exactly the same values it did print to System.out. 
It's also expected to show no values at all, or two values that differ by 1
</p>
<p>Issue 1: It actually doesn't, it only displays no or one value<br/>
Issue2: If you configure portal-ext.properties with
<pre>portlet.event.distribution=layout-set
    layout.default.p_l_reset=false
</pre>
and position this portlet on a different page than SenderPortlet, it's supposed to
still work. However, it's visible that the event is handled (see System.out), but
the renderParameters do not get persisted at all, e.g. it never shows any received
values.
<h2>Event "demo":</h2>
<% 
String lastPayload = renderRequest.getParameter("receivedPayload1");
String shortened = renderRequest.getParameter("shortened1");
if(lastPayload != null) { %>
  <p>Last payload received: <%=lastPayload%> (shortened <%=shortened %>)</p>
<% } else { %>
  <p>Nothing received</p>
<% } %>
<h2>Event "demo2":</h2>
<% 
lastPayload = renderRequest.getParameter("receivedPayload2");
shortened = renderRequest.getParameter("shortened2");
if(lastPayload != null) { %>
  <p>Last payload received: <%=lastPayload%> (shortened <%=shortened %>)</p>
<% } else { %>
  <p>Nothing received</p>
<% } %>
