package com.liferay.issue;

import com.liferay.util.bridges.mvc.MVCPortlet;

import javax.portlet.EventRequest;
import javax.portlet.EventResponse;
import javax.portlet.ProcessEvent;

/**
 * Portlet implementation class ReceiverPortlet
 */
public class ReceiverPortlet extends MVCPortlet {
	  @ProcessEvent(qname="{http://liferay.com/issue}demo1")
	  public void handleDemoEvent(EventRequest request, EventResponse response) {
		  String payload = (String)request.getEvent().getValue();
		  System.out.println("handling demo1 event " + payload);
		  response.setRenderParameter("receivedPayload1", payload);
		  response.setRenderParameter("shortened1", payload.substring(0, 5));
	  }

	  @ProcessEvent(qname="{http://liferay.com/issue}demo2")
	  public void handleDemo2Event(EventRequest request, EventResponse response) {
		  String payload = (String)request.getEvent().getValue();
		  System.out.println("handling demo2 event " + payload);
		  response.setRenderParameter("receivedPayload2", payload);
		  response.setRenderParameter("shortened2", payload.substring(0, 5));
	  }
}
