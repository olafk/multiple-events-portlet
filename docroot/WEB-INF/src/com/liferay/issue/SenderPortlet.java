package com.liferay.issue;

import com.liferay.util.bridges.mvc.MVCPortlet;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.xml.namespace.QName;

/**
 * Portlet implementation class SenderPortlet
 */
public class SenderPortlet extends MVCPortlet {
 
	public void send(ActionRequest request, ActionResponse response) {
		QName qName = new QName("http://liferay.com/issue", "demo1");
		double payload1 = Math.random();
		response.setEvent(qName, ""+payload1);

		double payload2 = Math.random();
		qName = new QName("http://liferay.com/issue", "demo2");
		response.setEvent(qName, ""+(payload2));

		response.setRenderParameter("lastPayload1", ""+payload1);
		response.setRenderParameter("lastPayload2", ""+payload2);
		System.out.println("SenderPortlet just sent " + payload1 + " and " + payload2 + " via IPC event");
	}
}
