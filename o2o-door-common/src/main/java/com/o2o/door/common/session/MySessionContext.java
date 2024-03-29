package com.o2o.door.common.session;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

public class MySessionContext {
	@SuppressWarnings("rawtypes")
	private static HashMap mymap = new HashMap();

	@SuppressWarnings("unchecked")
	public static synchronized void AddSession(HttpSession session) {
		if (session != null) {
			mymap.put(session.getId(), session);
		}
	}

	public static synchronized void DelSession(HttpSession session) {
		if (session != null) {
			mymap.remove(session.getId());
		}
	}

	public static synchronized HttpSession getSession(String session_id) {
		if (session_id == null) {
			return null;
		}
		return (HttpSession) mymap.get(session_id);
	}
}
