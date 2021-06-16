package com.iya.board.service;

import org.springframework.ui.Model;

public interface ServiceInterface {
	public void add(Model model);
	public void modify(Model model);
	public void delete(Model model);
	public void print(Model model);
	public void detailPrint(Model model);
	public void find(Model model);

}
