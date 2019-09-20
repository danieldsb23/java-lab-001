package com.phoenixone.bean;

import java.util.HashSet;
import java.util.Set;

public class NameListManagerBean {
	private Set<String> names = new HashSet<String>();
		
	public void add(String name) {
		names.add(name);
	}
	
	public void remove(String name) {
		names.remove(name);
	}
	
	public Set<String> getNames() {
		return names;
	}
	
}
